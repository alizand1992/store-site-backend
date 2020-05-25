class ItemsController < ApplicationController
  def index
    items = Item.all

    render json: items.to_json, status: :ok
  rescue => e
    render json: { error: e.message }.to_json, status: :internal_server_error
  end

  def show
    item = Item.find(params[:id])

    render json: { item: item }.to_json, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { no_content: true }.to_json, status: :ok
  end

  def create
    item = Item.new(item_params)

    unless item.thumbnail.present?
      item.thumbnail = item_params[:images].first
    end

    item.save!

    if params[:fields].present?
      ItemAttribute.create_or_save_from_json(params[:fields], item.id)
    end

    render json: { id: item.id }.to_json, status: :ok
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)

    unless item.thumbnail.present?
      item.thumbnail = item.images.first
    end

    if params[:fields].present?
      ItemAttribute.create_or_save_from_json(params[:fields], item.id)
    end

    render json: { id: item.id }.to_json, status: :ok
  end

  def images
    images = Item.find(params[:id]).images.map do |image|
      {
        blob_id: image.id,
        url: rails_blob_url(image),
        name: image.filename,
      }
    end

    render json: { images: images }.to_json, status: :ok
  end

  private

  def item_params
    @item_params = params.permit(:name, :show_in_gallery, images: {})
    @item_params[:images] = @item_params[:images].values if @item_params[:images].present?
    @item_params
  end
end
