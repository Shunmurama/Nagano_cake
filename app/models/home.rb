class Home < ApplicationRecord

  enum how_to_pay_method: { credit_card: 0, transfer: 1 }


end
