# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  category    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  landlord_id :integer
#
class Category < ApplicationRecord
end
