# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  private
  def check_captcha
    puts "innnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn"
    unless verify_recaptcha
      self.resource = resource_class.new sign_in_params
      respond_with_navigational(resource) { render :new }
    end
  end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
