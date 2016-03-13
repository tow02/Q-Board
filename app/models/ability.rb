class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    # In case user has more than 1 role, select order by desc
    user_role ||= UserRole.where(user_id: user.id).order(:role_id).first

    if user_role.nil? # if guest user
      can :read, [Room, Question, Answer, Comment, Tag]
    else
      if user_role.admin?
        can :manage, :all
      elsif user_role.moderator?
        can :read, Room
        can [:create, :read, :update, :destroy], [Question, Answer, Comment, Image]
        can [:create, :read], Tag
      elsif user_role.member?
        can :read, Room
        can [:create, :read], [Question, Answer, Comment, Tag, Image]
        can :update, Question do |question|
          question.try(:user) == user # allow user to update his/her own questions.
        end
        can :update, Answer do |answer|
          answer.try(:user) == user # allow user to update his/her own answers
        end
        can :update, Comment do |comment|
          comment.try(:user) == user # allow user to update his/her own comments
        end
        can :update Image do |image|
          image.try(:user) == user # allow user to update his/her own images
        end
      end

    end
  end
end

# Room
  # Moderator: :read
  # Member: :read

# Question
  # Moderator: :create, :read, :update, :destroy
  # Member: :create, :read
    # User's own questions: :update

# Answer
  # Moderator: :create, :read, :update, :destroy
  # Member: :create, :read
    # User's own answers: :update

# Comment
  # Moderator: :create, :read, :update, :destroy
  # Member: :create, :read
    # User's own comments: :update

# Tag
  # Moderator: :create, :read
  # Member: :create: :read

# Image
  # Moderator: :create, :read: :update, :destroy
  # Member: :create, :read
    # User's own images, :update
