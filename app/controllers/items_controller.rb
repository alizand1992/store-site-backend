class ItemsController < ApplicationController
  def index
    items = Item.all

    render json: items.to_json, status: :ok
  rescue => e
    render json: { error: e.message }.to_json, status: :internal_server_error
  end

  def show
    item = Item.find(params[:id])

    images = item.images.map do |image|
      {
        url: rails_blob_url(image),
        name: image.filename,
      }
    end

    render json: { item: item, images: images }.to_json, status: :ok
  end

  def create
    item = Item.new(item_params)

    item.save!

    if params[:fields].present?
      ItemAttribute.create_or_save_from_json(params[:fields], item.id)
    end

    render json: { id: item.id }.to_json, status: :ok
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)

    if params[:fields].present?
      ItemAttribute.create_or_save_from_json(params[:fields], item.id)
    end

    render json: { }.to_json, status: :ok
  end

  private

  def item_params
    @item_params = params.permit(:name, :show_in_gallery, images: {})
    @item_params[:images] = @item_params[:images].values
    @item_params
  end
end
