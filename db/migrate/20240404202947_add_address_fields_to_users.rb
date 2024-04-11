class AddAddressFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :province, :string
  end
end
