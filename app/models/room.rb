# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Room < ActiveRecord::Base
  has_many :questions

  before_save { self.name.downcase! }
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
