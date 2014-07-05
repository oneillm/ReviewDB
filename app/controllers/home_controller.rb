class HomeController < ApplicationController
   def index
     session[:home_page] = request.env['HTTP_Referer'] || root_url
   end



end
