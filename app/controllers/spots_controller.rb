class SpotsController < ApplicationController
  require 'open3'

  add_breadcrumb 'Top', '/'
  add_breadcrumb '観光地一覧', :index_path

  def index
  end

  def show
    @spot = Spot.find(params[:id])
    add_breadcrumb @spot.name, :spot_path
    # TODO 機械学習の学習済みモデル追加後修正
    # @test = Open3.capture3('forego','run','python','./ml/twitter_scrap.py',@spot.name)[0]

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
    @evaluation_point = Open3.capture3('python','./ml/random_spot_evaluation.py', "#{@twitter.tweet.count}")[0]
    render action: 'show'
  rescue => e
    logger.error e.message
    flash[:error] = "エラーが起きました[#{e.message}]"
    render action: 'show'
  end
end
