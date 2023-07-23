class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

 protected
  def configure_permitted_parameters

   # サインアップ時にnameのストロングパラメータを追加
   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :encrypted_password])

   # アカウント編集の時にnameとprofileのストロングパラメータを追加
   devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :encrypted_password])
 end
end
