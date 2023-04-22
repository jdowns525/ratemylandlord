class ChangeUsefulTypeInReviews < ActiveRecord::Migration[6.0]
  def change
    change_column :reviews, :useful, :string
  end
end
