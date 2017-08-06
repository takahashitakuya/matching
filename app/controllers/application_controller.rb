class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   helper_method :get_user_profile_id
   def get_user_profile_id
       if Profile.exists?(user_id: current_user.id)
        profile = Profile.find_by user_id: current_user.id
        profile.id
      end
  end 
end
