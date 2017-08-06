class CoverImage < ApplicationRecord
    belongs_to :profile

    
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>",:square => '400x400#',:card => '242x200#' }
    
    
    
    
    validates :profile_id, presence: true
    validates :image, presence: true
    validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }    
    
end
