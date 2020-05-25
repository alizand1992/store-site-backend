class GalleryController < ApplicationController
  # Get the thumbnail for work available
  def index
    items = Item.where(show_in_gallery: true)

    items = items.map do |item|
      thumbnail = item.thumbnail || item.images.first

      hash = {
        id: item.id,
        name: item.name,
      }

      hash[:thumbnail] = rails_blob_url(thumbnail) if thumbnail.present?

      hash
    end

    render json: { items: items }.to_json, status: :ok
  end
end
