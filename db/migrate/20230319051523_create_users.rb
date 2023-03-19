class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.integer :user_id
      t.string :name
      t.string :review_count
      t.string :average_stars

      t.timestamps
    end
  end
end
