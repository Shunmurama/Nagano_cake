class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  has_one_attached :image

    def subtotal
      item.with_tax_price * amount
    end

  def @item.get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage-760x460.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
