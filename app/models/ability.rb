class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # Define User abilities
    if user.is? :admin
      can :manage, :all
    elsif user.is? :default
      can :manage, Post, author: user
      can :manage, Comment, author: user
      can :read, :all
    end
  end
end
