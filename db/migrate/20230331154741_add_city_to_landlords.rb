class AddCityToLandlords < ActiveRecord::Migration[6.0]
  def change
    add_column :landlords, :city, :string
  end
end
