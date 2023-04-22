class ChangeReviewAttributesTypeInReviews < ActiveRecord::Migration[6.0]
  def change
    change_column :reviews, :maintenance_and_repairs, :string
    change_column :reviews, :respectfulness, :string
    change_column :reviews, :responsiveness, :string
  end
end
