class ApplicationController < ActionController::Base
        before_action :configure_permitted_parameters, if: :devise_controller?
        before_action :set_user_profiles
      
        protected
      
        def configure_permitted_parameters
          # Permit additional parameters for sign up and account update
          devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :current_password])
          devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password])
        end

        def after_sign_in_path_for(resource)
          if resource.is_a?(User)
            if resource.profile.nil? || resource.profile.location.blank? || resource.profile.website.blank? || resource.profile.bio.blank?
              new_profile_path
            else
              tweets_path
            end
          else
            super
          end
        end
        private
        def set_user_profiles
          @profiles = Profile.all
        end 
        def set_tweets
          @tweets = Tweet.all
        end 

        def display_side_bars?
          !(controller_name == "tweets" && action_name == "home")
        end 
end 
