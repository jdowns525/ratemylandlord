class AddCaptionToLandlords < ActiveRecord::Migration[6.0]
  def change
    add_column :landlords, :caption, :text
  end
end
