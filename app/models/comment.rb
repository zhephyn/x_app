class Comment < ApplicationRecord
    belongs_to :tweet
    belongs_to :user
    has_many :likes, as: :likeable
    has_many :bookmarks, as: :bookmarkable
end
