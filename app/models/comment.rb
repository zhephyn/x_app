class Comment < ApplicationRecord
    belongs_to :tweet
    belongs_to :retweet
    belongs_to :quote
    belongs_to :user
    has_many :likes, as: :likeable
    has_many :bookmarks, as: :bookmarkable
end
