class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = User.find(params[:followed_id])
    current_user.followed_users << @user
    redirect_to profile_path(@user), notice: "You successfully followed this user"
  end

  def destroy
    @user = current_user
    @relationship = Relationship.find_by(follower_id: current_user.id, followed_id: params[:id])
    @relationship.destroy
    redirect_to profile_path(@user), notice: "You successfully unfollowed this user"
  end

  def destroy
    #find the user who is followed by the current user by using the followed id
    @user = Relationship.find(params[:followed_id])
    #unfollow them using the unfollow e
    current_user.unfollow(@user)
    redirect_to 
  end
end

