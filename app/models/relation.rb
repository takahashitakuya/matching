class Relation < ApplicationRecord
    
    belongs_to :src, class_name: 'Profile', :foreign_key => 'profile_id'
    belongs_to :target, class_name: 'Profile', :foreign_key => 'target_profile_id'
    
end
