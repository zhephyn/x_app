class Relationship < ApplicationRecord
    belongs_to :follower, class_name: "User"
    belongs_to :followed, class_name: "User"
     def following?
     end
     def follow(user)
        #adds the user to the array of people already folllowing the user in question ie the one who the method is called on
     end
     def unfollow(user)
        #removed the user from the array of people already following the user 
     end
end
