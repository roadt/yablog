class Ability
  include CanCan::Ability

  def initialize(user) 
    can :read, :all
    
    can :manage, User, id: user.id
    can :manage, Article, user_id: user.id
    can :manage, Post, user_id: user.id
    can :manage, Comment, user_id: user.id
    can :manage, Like, user_id: user.id
  end
end
