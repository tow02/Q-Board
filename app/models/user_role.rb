# == Schema Information
#
# Table name: user_roles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  role_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  validates_uniqueness_of :user_id, :scope => :role_id

  def admin?
    self.role.name == "Admin"
  end

  def moderator?
    self.role.name == "Moderator"
  end

  def member?
    self.role.name == "Member"
  end
end
