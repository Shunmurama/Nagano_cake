class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
   def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
       admin_path
    else
       root_path
    end
   end

   def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope ==:admin
       admin_session_path
    else
       customer_session_path
    end
   end


  protected
   def configure_permitted_parameters

    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number,])

    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number,])
   end
end
