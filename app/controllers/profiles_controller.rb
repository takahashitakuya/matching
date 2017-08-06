class ProfilesController < ApplicationController
  before_action:set_profile,only:[:show,:edit,:update,:destroy]
  before_action :authenticate_user!
  def index
    cur = current_user
    @q = Profile.includes(:user).ransack(params[:q])
   
    if current_user.profile != nil
      @profiles = @q.result.page(params[:page]).where.not(id: current_user.profile.id).order("users.last_sign_in_at DESC")
    else
      @profiles = @q.result.page(params[:page])
    end
  end

  def new
    @user = User.find(current_user.id)
    
    if Profile.exists?(user_id: current_user.id)
      @profile = Profile.find_by user_id: current_user.id
      redirect_to edit_profile_path(@profile)
    else
      @profile = Profile.new
      @profile.profile_terms.build
    end
  end
  
  def create
    
   
    @user = User.find(current_user.id)
    @profile  = @user.build_profile
    @profile = Profile.new(profile_params)

    if @profile.save
       redirect_to profiles_path
      
    else
      render :new
    end    
    
  end
  
  def edit
    @user = User.find(current_user.id)
   
     if Profile.exists?(user_id: current_user.id)
  
      else
    #   redirect_to new_profile_path
      
    end   
  end
  def update
    if request.xhr?
      #result = {'params' => params}
      @profile = Profile.find(params[:id])
      if params['Profile']['user_icon_id'] != nil
          @profile.update(:user_icon_id => params['Profile']['user_icon_id']);
          render :json => {'text':@profile}
      else
         @profile.update(:main_cover_id => params['Profile']['main_cover_id']);
          render :json => {'text':@profile}
      end
      
    else
       if @profile.update(profile_params)
        redirect_to profiles_path
      else
        render :edit
      end      
    end
 
  end

  def show
  end
  
  def destroy
    
  end
  

  private
  def set_profile
    @profile = Profile.find(params[:id])
  end
  
  def get_image
    @image = Profile.find(params[:id])
    send_data(@image.image, :disposition => "inline", :type => "image/png")
  end  


  def profile_params
    params.require(:profile).permit(
      :user_id,
      :display_name,
      :description,
      :policy,
      :catch_copy,
      :profile_image,
      :profile_image_name,
      :cover_image,
      :content,
      :staff_lastname,
      :staff_firstname,
      :tel,
      :fax,
      :website,
      :postal_code,
      :address_pref,
      :address_city,
      :address_number,
      :address_building,
      :address_full,
     {term_ids: []},
      )
  end  
  
end