class SpotsController < ApplicationController
  def index
  end

  def show
    @spot = Spot.find(params[:id])
    @twitter ||= MyTwitter.new
    if @twitter && @spot.name
      @twitter.tag = @spot.name
      # #の処理
      tag = @twitter.tag.slice(0) == '#' ?  @twitter.tag.slice(1, 999) : @twitter.tag
      @twitter.tweet = @twitter.client.search("##{tag}", lang: "ja", result_type: 'recent',exclude: "retweets", count: 50).map do |tweet|
        {
            icon: tweet.user.profile_image_url,
            name: tweet.user.name,
            text: tweet.text
        }
      end.sort do |a, b|
        b[:rt] <=> a[:rt]
      end
    end
    render action: 'show'
  rescue => e
    logger.error e.message
    flash[:error] = "エラーが起きました[#{e.message}]"
    render action: 'show'
  end
end
