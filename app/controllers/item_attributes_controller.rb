class ItemAttributesController < ApplicationController
  def index
    attrs = ItemAttribute.where(item_id: params[:item_id]).compact

    render json: { attrs: attrs }.to_json, status: :ok
  end

  def create
    item_id = params[:item_id]
    params[:attrs].each do |attr|
      ItemAttribute.new(
        item_id: item_id,
        name: attr[:name],
        value: attr[:value]
      ).save!
    end

    render json: { success: :ok }.to_json, status: :ok
  end
end
