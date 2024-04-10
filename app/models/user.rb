class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_one :profile
  has_many :tweets 

  has_many :followed_relationships, foreign_key: :follower_id, class_name: "Relationship"
  #above is for checking followed relationships associated with the current user
  has_many :followed_users, through: :followed_relationships, source: :followed
  #above is for getting an array/collection of the users followed by a current user
  has_many :follower_relationships, foreign_key: :followed_id, class_name: "Relationship"
  has_many :followers, through: :follower_relationships, source: :follower
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def following?(user)
    relationships.find_by_followed_id(user.id)
  end
  # whats the difference between a method with a bang and that without
  def follow(user)
    relationships.create(followed_id: user.id)
  end
  
  def unfollow(user)
    relationships.find_by_followed_id(followed_id :user.id)destroy
  end
end
