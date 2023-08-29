class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  enum how_to_pay: { credit_card: 0, transfer: 1 }


  def full_name
    self.last_name + " " + self.first_name
  end
end
