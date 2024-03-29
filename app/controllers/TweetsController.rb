class TweetsController < ApplicationController
    before_action :authenticate_user! for all actions
    before_action :set_post for show, edit,update and destroy actions
    def home
    end

    def index
    end

    def show
    end

    def new
    end

    def edit
    end

    def updated
    end

    def destroy
    end

    private
    def tweet_params
    end
    
    def set_post
    end
end