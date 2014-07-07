class Ability
  include CanCan::Ability
  
  def initialize(login)
    login ||= Login.new  #incase no sign in or anomynous user
    if login.role == "admin" || login.role == "both" ||:login.role == "administrator"
        can :manage, :all  
    else
       if login.username.downcase == "admin"
          can :create, Login
          can :update, Login
       end
    end
  end
end
