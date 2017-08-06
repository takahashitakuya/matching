class CoverImagesController < ApplicationController
  def index
  end

  def show
  end
  def new
    @cover_images = CoverImage.where(profile_id:current_user.profile.id)
    @cover_image = CoverImage.new
    
  end
  def create
   @cover_image = CoverImage.new(cover_image_params)
   if @cover_image.save
      redirect_to  new_cover_image_path
   else
     @cover_images = CoverImage.where(profile_id:current_user.profile.id)
     render new_cover_image_path
   end
  end
  def profile
  end
  
  def cover_image_params
      params.require(:cover_image).permit(:image,:caption,:profile_id)
 end
end
