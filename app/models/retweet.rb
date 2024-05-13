class Retweet < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, optional: true
  has_many :likes, as: :likeable
  has_many :bookmarks, as: :bookmarkable
end
