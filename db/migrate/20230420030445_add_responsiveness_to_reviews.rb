class AddResponsivenessToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :responsiveness, :boolean
  end
end
