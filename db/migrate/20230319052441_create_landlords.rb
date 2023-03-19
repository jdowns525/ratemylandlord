class CreateLandlords < ActiveRecord::Migration[6.0]
  def change
    create_table :landlords do |t|
      t.string :name
      t.string :neighborhood
      t.string :address
      t.string :state
      t.string :postal_code
      t.float :latitude
      t.float :longitude
      t.float :stars
      t.string :review_count
      t.integer :reviews_count

      t.timestamps
    end
  end
end
