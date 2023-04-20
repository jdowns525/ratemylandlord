# == Schema Information
#
# Table name: reviews
#
#  id                      :integer          not null, primary key
#  city                    :string
#  communication           :boolean
#  cool                    :integer
#  date_occupancy          :date
#  date_vacancy            :date
#  maintenance_and_repairs :boolean
#  respectfulness          :boolean
#  responsiveness          :boolean
#  stars                   :integer
#  text                    :text
#  useful                  :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  landlord_id             :integer
#  user_id                 :integer
#
class Review < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:landlord, { :required => true, :class_name => "Landlord", :foreign_key => "landlord_id", :counter_cache => true })
  has_many :messages
end
