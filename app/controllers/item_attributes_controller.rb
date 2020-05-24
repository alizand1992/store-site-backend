class ItemAttributesController < ApplicationController
  def index
    attrs = ItemAttribute.where(item_id: params[:item_id]).compact

    render json: { attrs: attrs }.to_json, status: :ok
  end
end
