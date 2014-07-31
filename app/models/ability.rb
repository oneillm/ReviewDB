class Ability
  include CanCan::Ability
  
  def initialize(login)
    login ||= Login.new  #incase no sign in or anomynous user
    if login.role == "admin" || login.role == "both" ||login.role == "administrator"
        if login.status == "active"
		can :manage, :all
        end  
    else
       if login.username.downcase == "admin"
          can :manage, Login
          #can :update, Login
       else
         # cannot :manage, Login
         # cannot :manage, Business
         # cannot :manage, Socialmediasite
         # cannot :manage, Ssdmapping 
       end
    end
  end
end
