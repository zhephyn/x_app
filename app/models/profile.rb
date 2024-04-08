class Profile < ApplicationRecord
    belongs_to :user
    validates :user_id , uniqueness: true
    has_one_attached :profile_photo
    has_one_attached :cover_photo
end
