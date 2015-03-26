class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new # guest user (not logged in)

    can :read, Bookmark
    can :read, Domain

    # can :manage, Domain
    # can :create, Domain


    if user.blank?
      # not logged in
    else
      # logged in
      can :manage, Bookmark
    end

  end
end
