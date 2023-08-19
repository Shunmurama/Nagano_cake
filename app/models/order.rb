class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  enum how_to_pay_method: { credit_card: 0, transfer: 1 }

  def total
    @total_price = (@total + cart_item.item.price*@tax).floor(:delimited)
  end

  def full_name
    self.last_name + " " + self.first_name
  end
end
