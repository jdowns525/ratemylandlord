# == Schema Information
#
# Table name: support_requests
#
#  id         :integer          not null, primary key
#  email      :string
#  message    :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SupportRequest < ApplicationRecord
end
