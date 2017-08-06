class Profile < ApplicationRecord
  belongs_to :user,:foreign_key => 'user_id',dependent: :destroy
 
  has_many :profile_terms,dependent: :destroy
  has_many :term, through: :profile_terms,dependent: :destroy
  
  has_many :relation, class_name: 'Relation', :foreign_key => 'profile_id',dependent: :destroy
  has_many :target_relation, class_name: 'Relation', :foreign_key => 'target_profile_id'  ,dependent: :destroy
  
  has_many :message_from, class_name: 'Message', :foreign_key => 'from_id',dependent: :destroy
  has_many :message_to, class_name: 'Message', :foreign_key => 'to_id'  ,dependent: :destroy
  
  has_many :cover_images,dependent: :destroy
  has_many :monologs,dependent: :destroy
  
  # has_one :main_cover,class_name: 'CoverImage',:primary_key => 'main_cover_id'
  # has_one :user_icon,class_name: 'CoverImage',:primary_key => 'user_icon_id'
  
  accepts_nested_attributes_for :profile_terms
  
  has_attached_file :profile_image, styles: { medium: "300x300>", thumb: "100x100>",:square => '100x100#',:card => '242x200#' }
  validates_attachment :profile_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

 

  has_attached_file :cover_image,  styles: { medium: "300x300>", thumb: "100x100>",:square => '100x100#',:card => '242x200#' }
  validates_attachment :cover_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

## 自分がgoodかskipをしている場合
#  if profile.target_relation.where(profile_id: current_user.profile.id).size > 0

## 相手からgoodかskipされている場合
# if current_user.profile.target_relation(profile_id: profile.id).size >0

## 状態一覧
# 何も関連がない状態
# 自分がgoodをしている状態
# 自分がskipをしている状態
# 相手にgoodされている状態
# 相手にskipされている状態
# お互いにgoodしている状態
# お互いにskipしている状態
# 自分はgoodをしているが相手がskipしている状態
# 相手にgoodされているが自分はskipしている状態


  def is_reration(prof_id)
    target_relation.where(profile_id: prof_id).size    
  end
  
  def self_relation_status(prof_id)
    #自分から相手に送ったリアクション
    if target_relation.where(profile_id: prof_id).size > 0
      target_relation.where(profile_id: prof_id)[0].status
    end
  end
  
  def second_relation_status(prof_id)
   
    if  Profile.find(prof_id).target_relation.where(profile_id: id).size > 0
        Profile.find(prof_id).target_relation.where(profile_id: id)[0].status
    end
  end
  
  def check_relation_status(prof_id)
    if self_relation_status(prof_id) == "good" && second_relation_status(prof_id)
      "matching"
      
    elsif self_relation_status(prof_id) == "good"
      "from_good"
     elsif self_relation_status(prof_id) == "skip"
      "from_skip"   
    elsif second_relation_status(prof_id) == "good"
      "to_good"

    else
      "nothing"
    end
  end
  
  def echo_user_icon
    if user_icon_id != nil && CoverImage.exists?(id: user_icon_id)
      res =  CoverImage.find(user_icon_id)
      res.image
    elsif profile_image?
      profile_image
    else
      false
    end
  end
 
  def echo_main_cover
    if main_cover_id != nil && CoverImage.exists?(id: main_cover_id)
      res =  CoverImage.find(main_cover_id)
      res.image
    elsif cover_image?
      cover_image
    else
      false
    end
  end 
  
end