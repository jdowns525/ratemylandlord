class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :receiver_id
      t.text :content
      t.integer :review_id

      t.timestamps
    end
  end
end
