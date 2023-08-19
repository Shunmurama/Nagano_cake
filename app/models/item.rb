class Item < ApplicationRecord
  has_many :cart_itmes, dependent: :destroy
  belongs_to :genre

  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

  def with_tax_price
    (price * 1.1).floor(:delimited)
  end



  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage-760x460.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
