class ItemsController < ApplicationController
  def index
    items = Item.all

    render json: items.to_json, status: :ok
  rescue => e
    render json: { error: e.message }.to_json, status: :internal_server_error
  end

  def show
    item = Item.find(params[:id])
    attrs = ItemAttribute.find_by(item_id: params[:id])

    render json: { item: item, attrs: attrs}.to_json, status: :ok
  end

  def create
    item = Item.new(
      name: params[:name],
      show_in_gallery: params[:show_in_gallery]
    )

    item.save!

    if params[:new_field].present?
      new_field = JSON.parse(params[:new_field])

      ItemAttribute.new(
        item_id: item.id,
        name: new_field['name'],
        value: new_field['value']
      ).save!
    end

    render json: { id: item.id, fields: ItemAttribute.find_by(item_id: item.id) }.to_json, status: :ok
  end
end
