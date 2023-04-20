class AddUserToLandlords < ActiveRecord::Migration[6.0]
  def change
    t.references :user, foreign_key: true

    add_reference :landlords, :user, foreign_key: true
  end
end
