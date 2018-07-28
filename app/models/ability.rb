class Ability
  include CanCan::Ability

  def initialize(user) 
    can :read, :all
    can :manage, User, id: user.id
    can :manage, Article, user_id: user.id
  
  end
end