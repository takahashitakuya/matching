class PagesController < ApplicationController
  def top
    if user_signed_in?
      if current_user.profile != nil
        redirect_to profiles_path
      else
      redirect_to new_profile_path
      
    end
    end
    
  end
end
