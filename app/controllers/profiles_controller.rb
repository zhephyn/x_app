class ProfilesController < ApplicationController
    #callback private method to build profile after sign up should appear here
    def index
        #show all profiles of all users
        @profiles = Profile.all
    end

    def show
        #find a profile of any user whether they are signed in or not
        @profile = Profile.find(params[:id])
        @user = User.find(params[:id])
        @tweets = @user.tweets
    end

    def new
        #instantiate a new profile for each user at sign up before saving their details into the database
        @profile = current_user.build_profile
    end

    def create
        #create a new profile for each user at sign up before saving their details into the database
        @profile = current_user.create_profile(profile_params)
    end

    def edit
        #add user_id column to profile table for comparison
        #current user should own the profile if not, they cant edit the profile
        @profile = Profile.find(params[:id])
        if current_user.id == @profile.user_id
            render :edit
        else
            redirect_to :root, alert: "You are not authorised to edit this profile"
        end
    end

    def update
        #current user should own the profile if not, they cant update the profile
        @profile = Profile.find(params[:id])
        if current_user.id == @profile.user_id
            @profile.update(profile_params)
            @profile.save
            redirect_to profile_path(@profile), notice: "Profile was successfully updated"
        else
            redirect_to :root, alert "You are not authorised to edit this profile"
        end
    end

    def destroy
        #current user should own the profile if not, they cant delete the profile
        @profile = Profile.find(params[:id])
        if current_user.id == @profile.user_id
            @profile.destroy
            redirect_to :root
        end
    end

    private
    #add method to be used as a callback to build a user profile at the signup stage when they create an account
    def profile_params
        params.require(:user).permit(:bio, :location, :website)
    end
end
