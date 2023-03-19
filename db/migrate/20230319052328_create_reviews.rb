class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.datetime :date
      t.text :text
      t.integer :useful
      t.integer :cool
      t.integer :landlord_id
      t.integer :user_id
      t.string :city

      t.timestamps
    end
  end
end
