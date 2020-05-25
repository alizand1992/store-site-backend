class SitePropertiesController < ApplicationController
  def index
    render json: { properties: SiteProperty.all }.to_json, status: :ok
  end
end
