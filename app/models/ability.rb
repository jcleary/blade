class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Project, id: user.project_ids 
    can :manage, Build, project_id: user.project_ids
    can :manage, Test, project_id: user.project_ids
  end
end
