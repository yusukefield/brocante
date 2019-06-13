class ApplicationController < ActionController::Base
	#before_action :authenticate_user!
   protected

     def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :webname])#サインアップ時
       devise_parameter_sanitizer.permit(:account_update, keys: [:name, :webname])#編集時
     end
end
