class StaticPagesController < ApplicationController
 
def api
  @popupmsg = "API is an application-programming interface with a set of instructionson how to communicate with other software applications, usually web applications.
In order to establish communications, most of the web services providers or software application companies provide a key, an API key, to authenicate and grant access to users.  Each API key, also known as consumer key, or access key, is a unique identifier with specific access permission and privilege.</P>
<p> For our application to work, administrators/users need to acquire the API keys from the social media web service providers in order to send request for public review data responses.  The responses need to be in json format.</p>
<p> Some of the examples of social media service provider API we tested on are: twitter, Google Place Search, and Yelp. Other social media sites will also work as long as the responses are in json format and the data representation rules are applied correctly.</p>
<p>To apply for the API keys, please read each site's term of use and agreement, and follow each site's instruction to obtain the API keys.</p>"

#  sleep 1 #development only, simulates wait time
  respond_to do |format|
    format.html {render :api}  # { redirect_to static_pages_api_path } #for my controller, i wanted it to be JS only
    format.js {head :ok}
  end
end
 def about
  end

  def contactus
  end

end
