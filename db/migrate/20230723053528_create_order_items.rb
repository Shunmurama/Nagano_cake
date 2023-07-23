class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false
      t.integer :amount, null: false
      t.integer :purchase_price, null: false
      t.timestamps
    end
  end
end
