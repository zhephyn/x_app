class Tweet < ApplicationRecord
    belongs_to :user
    has_many :retweets, dependent: :destroy
    has_many :quotes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, as: :likeable
    has_many :bookmarks, as: :bookmarkable
end