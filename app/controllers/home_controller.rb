class HomeController < ApplicationController
   def index
     if !Login.exists?(username: 'admin')
        login = Login.create(firstname: "Admin", lastname: "Administrator", username: "admin", password: "guestuser", role: "other" , email: "123@123.com")
     end 
     session[:home_page] = request.env['HTTP_Referer'] || root_url
   end



end
