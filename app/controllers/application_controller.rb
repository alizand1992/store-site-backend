require 'application_responder'

class ApplicationController < ActionController::API
  respond_to :json
  include ActionController::MimeResponds

  def new
    render json: { authenticity_token: form_authenticity_token }.to_json, status: :ok
  end
end
