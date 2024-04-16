class ProfilesController < ApplicationController
    #callback private method to build profile after sign up should appear here
    def index
        @profiles = Profile.all
    end

    def show
        @profile = Profile.find(params[:id])
        @profile_owner = @profile.user
    end

    def new
        @profile = current_user.profile
        if current_user.profile.nil?
            @profile = current_user.build_profile
        else
            redirect_to edit_profile_path(@profile), notice: "You cant create a new profile, edit your existing profile instead"
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
            render :edit
        end
    end

    def edit
        @profile = Profile.find(params[:id])
        @user = current_user
        if @profile.user_id == @user.id
            render :edit
        else
            redirect_to new_profile_path, notice: "Can't edit profile, create one instead"
        end
    end

    def update
        @profile = Profile.find(params[:id])
        @user = current_user
        if @profile.user_id == @user.id
            ##line above could be made better by the find_by method
            @profile.update(profile_params)
            redirect_to profile_path(@profile), notice: "Profile was successfully updated"
        else
            redirect_to new_profile_path, notice: "Can't edit profile, create one instead"
        end
    end

    def destroy
        @profile = Profile.find(params[:id])
        if current_user.id == @profile.user_id
            @profile.destroy
            redirect_to :root
        end
    end

    private
    
    def profile_params
        params.require(:profile).permit(:bio, :location, :website, :profile_photo, :cover_photo)
    end
end
