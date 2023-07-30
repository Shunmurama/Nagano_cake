class Item < ApplicationRecord
  has_many :cart_itmes, dependent: :destroy
  belongs_to :genres

  has_one_attached :image
end
