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
end
