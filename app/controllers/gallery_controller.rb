class GalleryController < ApplicationController
  # Get the thumbnail for work available
  def index
    items = Item.where(show_in_gallery: true)

    items = items.map do |item|
      {
        id: item.id,
        thumbnail: rails_blob_url(item.images.first),
        name: item.name,
      }
    end

    render json: { items: items }.to_json, status: :ok
  end
end
