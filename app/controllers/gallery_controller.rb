class GalleryController < ApplicationController
  # Get the thumbnail for work available
  def index
    render json: { success: :ok }.to_json, status: :ok
  end
end
