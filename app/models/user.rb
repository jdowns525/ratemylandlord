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
#  user_role       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#
class User < ApplicationRecord
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true
  has_secure_password

  has_many :landlords
  has_many :messages
  has_many :received_messages, class_name: "Message", foreign_key: "receiver_id"
  has_many :reviews, class_name: "Review", foreign_key: "user_id", dependent: :destroy

  validates :user_role, presence: true, inclusion: { in: %w(renter landlord) }
  validate :debug_user_role

  private

  def debug_user_role
    Rails.logger.debug("user_role in model: #{user_role}")
  end
end
