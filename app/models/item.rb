class Item < ApplicationRecord
  has_many :cart_itmes, dependent: :destroy
  belongs_to :genres

  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/icon8-カップケーキ-color/icon8-カップケーキ-48.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
