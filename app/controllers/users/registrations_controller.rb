# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  
  def create
    super do |user|
      session_cart_id = session[:cart_id]
      if session_cart_id.present?
        user.link_cart_and_transfer_session_products(session_cart_id)
        session.delete(:cart_id)
      end
    end
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone])
  end

  def after_sign_up_path_for(resource)
    root_path
  end
end
