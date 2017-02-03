class HomeController < ApplicationController
    
    def index

      if current_user.present?
        render "index"
      else
        redirect_to new_user_session_path  
      end
    end

end