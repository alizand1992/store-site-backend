require 'application_responder'

class ApplicationController < ActionController::API
  respond_to :json
  include ActionController::MimeResponds

  before_action :authenticate_user!, only: [:is_user_signed_in?]

  def is_user_signed_in?
    render json: { logged_in: true }.to_json, status: :ok
  end

  def new
    render json: { authenticity_token: form_authenticity_token }.to_json, status: :ok
  end
end
