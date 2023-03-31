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
end
