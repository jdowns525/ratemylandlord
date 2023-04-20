class AddQualitiesToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :maintenance_and_repairs, :boolean
    add_column :reviews, :communication, :boolean
    add_column :reviews, :respectfulness, :boolean
  end
end
