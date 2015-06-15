#Ability
class Ability
  include CanCan::Ability
  # Define abilities for the passed in user.
  def initialize(user)
    # Handle the case where we don't have a current_user i.e. the user is a guest
    user ||= User.new
    can :read, :all
    can :create, Document
    can :update, Document do |document|
      document.try(:user) == user
    end
    can :destroy, Document do |document|
      document.try(:user) == user
    end
  end
end
