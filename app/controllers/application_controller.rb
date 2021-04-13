class ApplicationController < ActionController::Base
    
    def not_authenticated
        redirect_to login_path, alert: "Please login first"
    end
    
end
