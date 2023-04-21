# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  average_stars   :string
#  email           :string
#  landlord_type   :string
#  name            :string
#  password_digest :string
#  review_count    :string
#  role            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  has_many :landlords
  has_many :messages
  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id'

  has_many(:reviews, { :class_name => "Review", :foreign_key => "user_id", :dependent => :destroy })


  validates :role, presence: true
end
