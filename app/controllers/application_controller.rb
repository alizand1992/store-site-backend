class ApplicationController < ActionController::Base
  def new
    render json: { authenticity_token: form_authenticity_token }.to_json, status: :ok
  end
end
