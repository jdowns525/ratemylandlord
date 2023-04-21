class AddRoleAndLandlordTypeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :string
    add_column :users, :landlord_type, :string
  end
end
