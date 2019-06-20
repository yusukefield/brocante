class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
  #protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインに成功しました"
      root_path
  end

  def after_sign_out_path_for(resource)
    flash[:alert] = "ログアウトしました"
      root_path
  end

  # user
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :webname])
      devise_parameter_sanitizer.permit(:account_update, keys: [:image]) #ユーザーの画像編集を可にする
  end

  # host
  def devise_parameter_sanitizer
    if resource_class == Host
      HostParameterSanitizer.new(Host, :host, params)
    else
      super
    end
  end

end
