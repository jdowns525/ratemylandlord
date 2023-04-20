# == Schema Information
#
# Table name: landlords
#
#  id            :integer          not null, primary key
#  address       :string
#  caption       :text
#  city          :string
#  latitude      :float
#  longitude     :float
#  name          :string
#  neighborhood  :string
#  postal_code   :string
#  review_count  :string
#  reviews_count :integer
#  stars         :float
#  state         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Landlord < ApplicationRecord


  has_many(:reviews, { :class_name => "Review", :foreign_key => "landlord_id", :dependent => :destroy })
  has_many(:categories, { :class_name => "Category", :foreign_key => "landlord_id", :dependent => :destroy })

  def update_average_rating
    if self.reviews.present?
      average_rating = self.reviews.average(:stars)
      self.update(stars: average_rating)
    else
      self.update(stars: 0)
    end
  end
end
