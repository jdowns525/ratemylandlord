class AddDatesToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :date_occupancy, :date
    add_column :reviews, :date_vacancy, :date
  end
end
