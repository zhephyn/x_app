class Tweet < ApplicationRecord
    belongs_to :user
    belongs_to :tweet, optional: true
    has_many :comments, dependent: :destroy
end