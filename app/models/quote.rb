class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, optional: :true
  validates :body, presence: :true
  has_many :likes, as: :likeable
end
