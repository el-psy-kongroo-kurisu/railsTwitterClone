class TweetsController < ApplicationController
    def index
        @tweets = Tweet.includes(:user).with_attached_image.paginate(page: params[:page])
        render "home/index"
    end
    def create
        @tweet = current_user.tweets.build(tweet_params)
        #@tweet.image.attach(tweet_params[:image])
        if @tweet.save
          flash[:success] = "Tweet created!"
          redirect_to root_url
        else
          flash[:danger] = @tweet.errors.full_messages.to_sentence
          redirect_to root_url
        end
    end
    private
    def tweet_params
        params.require(:tweet).permit(:content, :image)
    end
end