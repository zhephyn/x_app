class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
  end
  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
  end

  #the code below is an alternative way to write the destroy action
  #def destroy
    #@relationship = Relationship.find_by(follower_id: current_user.id, followed_id: params[:id])
    #@relationship.destroy
  #end
  #def destroy_following
    #@relationship = current_user.relationships.find(params[:id])
    #@user = @relationship.followed
    #current_user.unfollow(@user)
    #redirect_to profile_path(@user)
  #end
end

