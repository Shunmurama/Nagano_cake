class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def after_sign_in_path_for(resource)
    home_path
  end



  def after_sign_out_path_for(resource)
    about_path
  end
end
