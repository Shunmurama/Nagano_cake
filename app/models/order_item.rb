class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

    def subtotal
      (purchase_price * 1.1).floor * amount
    end

end
