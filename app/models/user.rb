# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  average_stars   :string
#  email           :string
#  name            :string
#  password_digest :string
#  review_count    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  has_many :landlords
  has_many(:reviews, { :class_name => "Review", :foreign_key => "user_id", :dependent => :destroy })
end
