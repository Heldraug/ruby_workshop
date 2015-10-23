require 'oauth'
require 'awesome_print'
require 'pry'
require 'json'

class TwitterClient
  CONSUMER_KEY = 'DMEbBEWtTXp20zVcSbhw'
  CONSUMER_SECRET = '4KogGy7iMQd9BmNR5lGRcW0iF5pT87zzLqm6Inm0SY'
  OAUTH_KEY = '38909975-Pov2SpqASfpKNCt5kKYxcjlpBmRFU6zQ0riwdSIg9'
  OAUTH_SECRET = 'DR8L7qqtnpSOQQ9nFU9H3a0oqvbF25z7uO5UpKh0pg'

  BASE_URI = 'https://api.twitter.com/1.1'

  def initialize
    consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, { :site => "https://api.twitter.com", :scheme => :header })
    token_hash = { :oauth_token => OAUTH_KEY, :oauth_token_secret => OAUTH_SECRET }
    @client = OAuth::AccessToken.from_hash(consumer, token_hash)
  end

  def query_api(method, path)
    JSON.parse(@client.request(method, "#{BASE_URI}#{path}").body)
  end

  def home_timeline
    query_api(:get, '/statuses/home_timeline.json')
  end

  def user_timeline
    query_api(:get, '/statuses/user_timeline.json')
  end

  def retweets
    query_api(:get, '/statuses/retweets_of_me.json')
  end

  def post(status)
    query_api(:post, '/statuses/update.json')
  end
end

twitter = TwitterClient.new
ap twitter.home_timeline
ap twitter.user_timeline
ap twitter.retweets
