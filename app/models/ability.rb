class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
      if user.is_admin?
        if user.role == 3
          can :manage, :all
        else
          cannot [:destroy], [User]
        end
      else
        can :read, :all
      end
  end
end
