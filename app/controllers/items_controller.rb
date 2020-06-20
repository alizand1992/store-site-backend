class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :save_images, :update]

  def index
    items = Item.all

    render json: items.to_json, status: :ok
  rescue => e
    render json: { error: e.message }.to_json, status: :internal_server_error
  end

  def show
    item = Item.find(params[:id])
    attrs = item.item_attributes

    raise SecurityError if current_user.nil? && item.show_in_gallery == false

    render json: { item: item, attrs: attrs }.to_json, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { no_content: true }.to_json, status: :ok
  rescue SecurityError
    render json: { no_permission: true }.to_json, status: :unauthorized
  end

  def create
    item = Item.new(item_params)
    item.save!

    render json: { id: item.id }.to_json, status: :ok
  end

  def save_images
    item = Item.find(params[:id])

    item.images = params[:images].values if params[:images].present?
    item.save!

    if params[:deleted].present?
      params[:deleted].values.each do |img_id|
        begin
          img = ActiveStorage::Attachment.find(img_id)
          img.purge_later
        rescue ActiveRecord::RecordNotFound
          # Ignore deleting an already deleted file
        end
      end
    end

    render json: { success: :ok }.to_json, status: :ok
  end

  def select_thumbnail
    item = Item.find(params[:id])
    item.make_thumbnail(ActiveStorage::Attachment.find(params[:image_id]))

    item.save!

    render json: { success: :ok }.to_json, status: :ok
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)

    render json: { id: item.id }.to_json, status: :ok
  end

  def images
    item = Item.find(params[:id])

    raise SecurityError if current_user.nil? && item.show_in_gallery == false

    images = item.images.map do |image|
      rails_blob_url(image)
    end

    render json: { images: images }.to_json, status: :ok
  rescue SecurityError
    render json: { no_permission: true }.to_json, status: :unauthorized
  end

  def image_data
    images = Item.find(params[:id]).images.map do |image|
      {
        id: image.id,
        name: image.filename,
        url: rails_blob_url(image).gsub('http://127.0.0.1:5000/', 'alizand.io/api/'),
      }
    end

    render json: { images: images }.to_json, status: :ok
  end

  private

  def item_params
    @item_params = params.permit(:name, :show_in_gallery)
  end
end
