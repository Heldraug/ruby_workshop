require 'oauth'
require 'pp'
require 'pry'
require 'json'

class TwitterClient
  CONSUMER_KEY = 'DMEbBEWtTXp20zVcSbhw'
  CONSUMER_SECRET = '4KogGy7iMQd9BmNR5lGRcW0iF5pT87zzLqm6Inm0SY'
  OAUTH_KEY = '38909975-Pov2SpqASfpKNCt5kKYxcjlpBmRFU6zQ0riwdSIg9'
  OAUTH_SECRET = 'DR8L7qqtnpSOQQ9nFU9H3a0oqvbF25z7uO5UpKh0pg'

  def initialize
    consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, { :site => "https://api.twitter.com", :scheme => :header })
    token_hash = { :oauth_token => OAUTH_KEY, :oauth_token_secret => OAUTH_SECRET }
    @token = OAuth::AccessToken.from_hash(consumer, token_hash)
  end

  def home_timeline
    JSON.parse(@token.request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json").body)
  end

  def user_timeline
    JSON.parse(@token.request(:get, "https://api.twitter.com/1.1/statuses/user_timeline.json").body)
  end

  def retweets
    JSON.parse(@token.request(:get, "https://api.twitter.com/1.1/statuses/retweets_of_me.json").body)
  end

  def post(status)
    JSON.parse(@token.request(:post, "https://api.twitter.com/1.1/statuses/update.json", {status: status}).body)
  end
end
