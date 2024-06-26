class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :likes
  has_many :bookmarks
  has_one :profile
  has_many :tweets, dependent: :destroy
  has_many :retweets, dependent: :destroy
  has_many :quotes, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :active_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  def following?(user)
    following.include?(user)
  end

  def follow(user)
    following << user
  end

  def unfollow(user)
    following.delete(user)
  end

  def relationship_with(user)
    active_relationships.find_by(followed_id: user.id)
  end
end
