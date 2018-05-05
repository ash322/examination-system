class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #if can? :manage,User
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
            #can :read, Test.

      #alias_action :create, :read, :update, :destroy, :to => :crud
      user ||= User.new
      can [:show, :create,:welcome], Test #,user_id: current_user.id
      cannot :manage, Question

      if user.has_role? :admin
        can :manage, :all
        cannot :create, Test
        can :update_roles ,User

      elsif user.has_role? :hr
        can :manage,Question
        can :manage, Test
        cannot :create, Test
        can :manage, Paper

      elsif user.has_role? :normal_user
        can :manage, Test
        cannot :read, Test
      end
  end
end
