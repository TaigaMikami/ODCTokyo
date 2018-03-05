class MyTwitter < ApplicationRecord
  include ActiveModel::Model

  attr_accessor :tag, :limit, :tweet

  validates :tag, presence: true

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = "elAcJLzGhgJ9KDhCXLsET2w8S"
      config.consumer_secret = "TduF3oDFptl8h1FxXZVntwX3fyJ75SygAvzkSO2HFMr2naq4nc"
      config.access_token = '514081197-uwoGe30zdWP2ugct4mSkiKipJFYBeFvTnWGMQRCr'
      config.access_token_secret = '6U6UXZVetjjUng4sVL76ZZRnJA6gvjPcEOaJwegyMKZ5J'
    end
  end
end
