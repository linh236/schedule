class ApplicationController < ActionController::Base
  before_action :configure_permitted_params, if: :devise_controller?
  before_action :authenticate_user!

  include Pagy::Backend

  protected 

    def render_toast(title, message, type)
      render turbo_stream: turbo_stream.update("toastMessage", partial: "shared/toast", locals: { title: title, message: message, type: "#{type}" })
    end

    def full_mes object
      object.errors.full_messages.join("<br>")
    end

    def configure_permitted_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :birthday])
      # devise_parameter_sanitizer.permit(:account_update, keys: [:phone])
    end
end
