# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Role < ActiveRecord::Base
  has_many :user_roles
end
