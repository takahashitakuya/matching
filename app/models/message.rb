class Message < ApplicationRecord
    default_scope ->{order('created_at DESC')}
        belongs_to :from, class_name: 'Profile', :foreign_key => 'from_id'
        belongs_to :to, class_name: 'Profile', :foreign_key => 'to_id'
end
