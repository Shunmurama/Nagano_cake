class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.string :name, null: false
      t.integer :delivery_charge, null: false
      t.integer :amount, null: false
      t.integer :how_to_pay, null: false, default: 0
      t.timestamps
    end
  end
end
