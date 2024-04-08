class ProfilesController < ApplicationController
    #callback private method to build profile after sign up should appear here
    def index
        @profiles = Profile.all
    end

    def show
        @profile = Profile.find(params[:id])
        @user = User.find(params[:id])
        @tweets = @user.tweets
    end

    def new
        if current_user.profile.nil?
            @profile = current_user.build_profile
        else
            redirect_to tweets_path, notice: "You already have a profile"
        end
    end

    def create
        if current_user.profile.nil?
            @profile = current_user.build_profile(profile_params)
                if @profile.save
                    redirect_to profile_path(@profile), notice: "Profile was created succesfully"
                else
                    render :new
                end
        else
            redirect_to tweets_path, notice: "You already have a profile"
        end
    end

    def edit
        @profile = Profile.find(params[:id])
        if current_user.id == @profile.user_id
            render :edit
        else
            redirect_to tweets_path , alert: "You are not authorised to edit this profile"
        end
    end

    def update
        @profile = Profile.find(params[:id])
        if current_user.id == @profile.user_id
            @profile.update(profile_params)
            redirect_to profile_path(@profile), notice: "Profile was successfully updated"
        else
            redirect_to tweets_path, alert: "You are not authorised to edit this profile"
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
        params.require(:profile).permit(:bio, :location, :website)
    end
end
