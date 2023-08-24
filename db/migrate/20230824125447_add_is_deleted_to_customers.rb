class AddIsDeletedToCustomers < ActiveRecord::Migration[6.1]
  def change
    change_column :customers, :is_deleted, :boolean
  end
end
