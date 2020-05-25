class ItemAttributesController < ApplicationController
  def index
    attrs = ItemAttribute.where(item_id: params[:item_id]).compact

    render json: { attrs: attrs }.to_json, status: :ok
  end

  def create
    item_id = params[:item_id]

    ItemAttribute.where(item_id: item_id).destroy_all

    params[:attrs].each_with_index do |attr, index|
      ItemAttribute.new(
        item_id: item_id,
        name: attr[:name],
        value: attr[:value],
        order: attr[:order] || index + 1
      ).save!
    end

    render json: { success: :ok }.to_json, status: :ok
  end
end
