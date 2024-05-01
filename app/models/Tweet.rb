class Tweet < ApplicationRecord
    belongs_to :user
    has_many :retweets, dependent: :destroy
    has_many :quotes, dependent: :destroy
    has_many :comments, dependent: :destroy
end