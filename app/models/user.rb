# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :text
#  reputation             :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save { self.username.downcase! }
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_many :user_roles
  has_many :questions
  has_many :comments
  has_many :answers
  has_many :images
  has_many :votes

  after_create :assign_role

  private

    # assign user's role when the user signup
    # The default role is member
    def assign_role
      UserRole.create!(user_id: self.id, role_id: 3)
    end
end
