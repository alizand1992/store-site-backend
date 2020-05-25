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
    item.save!

    render json: { id: item.id }.to_json, status: :ok
  end

  def save_images
    item = Item.find(params[:id])

    item.thumbnail = params[:thumbnail]
    item.images = params[:images].values

    item.save!

    item.make_thumbnail(item.thumbnail)

    render json: { success: :ok }.to_json, status: :ok
  end

  def update
  end

  def images
  end

  private

  def item_params
    @item_params = params.permit(:name, :show_in_gallery)
  end
end
