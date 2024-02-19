class DropCustomers < ActiveRecord::Migration[7.1]
  def change
    drop_table :customers, if_exists: true
  end
end
