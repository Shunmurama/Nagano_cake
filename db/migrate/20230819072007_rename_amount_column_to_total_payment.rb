class RenameAmountColumnToTotalPayment < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :amount, :total_payment
  end
end
