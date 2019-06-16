# frozen_string_literal: true

class Hosts::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    # ここでUser.new（と同等の操作）を行う
    build_resource(configure_sign_up_params)
    # ここでUser.save（と同等の操作）を行う
    resource.save
    yield resource if block_given?
    if resource.persisted?# 先程のresource.saveが成功していたら
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else # 先程のresource.saveが失敗していたら
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected
  # sign_up時
  def configure_sign_up_params #まずsanitizerの中身を持ってくる lib/host_parameter_sanitizer/rb :host=>ホストの中身を指定
    devise_parameter_sanitizer.permit(:sign_up, keys: [:host=>[
      :group_name, :rep_name, :address, :phonenum,:email, :password, :password_confirmation
    ]])
    other_sign_up_params #次に下記のパラメーターを呼び出す
  end

  def other_sign_up_params #hostの許可されたキーのみ保存可
    params.require(:host).permit(:group_name, :rep_name, :address, :phonenum, :email, :password, :password_confirmation)
  end

  # こっちは更新時
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:host=>[
      :group_name, :rep_name, :address, :phonenum, :url, :email, :password, :password_confirmation, :current_password
    ]])
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
  #   super(resource)
      root_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def after_update_path_for(resource)
    root_path
  end

end
