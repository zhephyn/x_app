class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, optional: :true
  validates :body, presence: :true
  has_many :likes, as: :likeable
  has_many :bookmarks, as: :bookmarkable
  has_many :comments
end
