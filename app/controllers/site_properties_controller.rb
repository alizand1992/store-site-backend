class SitePropertiesController < ApplicationController
  def index
    render json: { properties: SiteProperty.all }.to_json, status: :ok
  end

  def update_all
    params[:properties].each do |prop|
      if prop[:dirty] == true
        site_property = SiteProperty.find(prop[:id])
        site_property.update(value: prop[:value])
      end
    end

    render json: { success: :ok }.to_json, status: :ok
  end
end
