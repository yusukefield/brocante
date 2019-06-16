# frozen_string_literal: true

class Hosts::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    self.resource = resource_class.new(configure_sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  # If you have extra params to permit, append them to the sanitizer.
  # sign_in時
  def configure_sign_in_params #まずsanitizerの中身を持ってくる lib/host_parameter_sanitizer/rb :host=>ホストの中身を指定
    devise_parameter_sanitizer.permit(:sign_in, keys: [:host=>[
      :email, :password
    ]])
  end

  #def after_sign_in_path_for(resource)
    #root_path
  #end

  #def after_sign_out_path_for(resource)
    #root_path
  #end

end
