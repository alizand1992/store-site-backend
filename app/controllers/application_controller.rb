require 'application_responder'

class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::Flash
  # before_action :devise_permitted_params, if: :devise_controller?
  self.responder = ApplicationResponder

  respond_to :json

  def render_resource(resource)
    raise resource.inspect

    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(_resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
        }
      ]
    }, status: :bad_request
  end

  def index
    render json: { success: :ok, flash: flash }.to_json, status: :ok
  end

  def new
    render json: { authenticity_token: form_authenticity_token }.to_json, status: :ok
  end

  # protected
  #
  # def devise_permitted_params
  #   devise_parameter_sanitizer.permit(
  #     :sign_up,
  #     keys: %i[first_name middle_name last_name]
  #   )
  # end


end
