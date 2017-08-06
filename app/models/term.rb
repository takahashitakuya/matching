class Term < ApplicationRecord
        has_many :profile_terms
    has_many :profiles, through: :profile_terms
end
