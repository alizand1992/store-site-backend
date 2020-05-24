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
  end

  def create
    item = Item.new(
      name: params[:name],
      show_in_gallery: params[:show_in_gallery]
    )

    item.save!

    if params[:fields].present?
      ItemAttribute.create_or_save_from_json(params[:fields], item.id)
    end

    render json: { id: item.id }.to_json, status: :ok
  end

  def update
    item = Item.find(params[:id])
    item.update(
      name: params[:name],
      show_in_gallery: params[:show_in_gallery]
    )

    if params[:fields].present?
      ItemAttribute.create_or_save_from_json(params[:fields], item.id)
    end

    render json: { }.to_json, status: :ok
  end
end
