# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  city        :string
#  cool        :integer
#  date        :datetime
#  stars       :integer
#  text        :text
#  useful      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  landlord_id :integer
#  user_id     :integer
#
class Review < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:landlord, { :required => true, :class_name => "Landlord", :foreign_key => "landlord_id", :counter_cache => true })
end
