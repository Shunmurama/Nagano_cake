class RenameIsDeletedColumnToCustomers < ActiveRecord::Migration[6.1]
  def change
    rename_column :customers, :is_deleted, :is_deleted
  end
end
