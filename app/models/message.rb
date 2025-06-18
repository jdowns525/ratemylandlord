# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  receiver_id :integer
#  review_id   :integer
#  user_id     :integer
#
class Message < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  belongs_to :receiver, class_name: "User"
  belongs_to :review
end
