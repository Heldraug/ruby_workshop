require 'oauth'
require 'awesome_print'
require 'pry'
require 'json'

class TwitterClient
  # @nsworkshop1
  # CONSUMER_KEY = 'l2TQg9K2xjRJ2WvOh5MXUvGHl'
  # CONSUMER_SECRET = 'rpHUCucSqEXOKLzPKN8IPBgRqDTzWx5yS3TymgTmTHOBkiFXD6'
  # OAUTH_KEY = '3996479112-GDjfiQCUVqCVR4pZN7hZeInTiYYBOEP0wtFfunr'
  # OAUTH_SECRET = 'swhYIdrZwBkYClUl7ItxKMZYulvpmFX8AYrihC4Ty0eTY'

  # @nsworkshop2
  CONSUMER_KEY = 'vbho2Ty63lhHSSWfmMJVGy5FR'
  CONSUMER_SECRET = 'GAh7ODImYpTWEnOzurUZQOkNREL7IFcsVmafBxOTxwFecE7pKE'
  OAUTH_KEY = '3985196954-MlrNxi0GU0xfDdK5NzpmWQSRSvP3Sf8hBDf6p7Z'
  OAUTH_SECRET = 'vVlu39uqN1GETWaGvgcLmUBGNtRtgnbm39YidmS0oTpbN'

  BASE_URI = 'https://api.twitter.com/1.1'

  def initialize
    consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, { :site => "https://api.twitter.com", :scheme => :header })
    token_hash = { :oauth_token => OAUTH_KEY, :oauth_token_secret => OAUTH_SECRET }
    @client = OAuth::AccessToken.from_hash(consumer, token_hash)
  end

  def query_api(method, path, options = nil)
    JSON.parse(@client.request(method, "#{BASE_URI}#{path}", options).body)
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
    query_api(:post, '/statuses/update.json', status: status)
  end
end

twitter = TwitterClient.new
ap twitter.home_timeline
ap twitter.user_timeline
ap twitter.retweets
