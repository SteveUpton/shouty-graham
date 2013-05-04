require 'twitter'
require 'tweetstream'

Twitter.configure do |config|
  config.consumer_key = ENV['sg_consumer_key']
  config.consumer_secret = ENV['sg_consumer_secret']
  config.oauth_token = ENV['sg_oauth_token']
  config.oauth_token_secret = ENV['sg_oauth_token_secret']
end

TweetStream.configure do |config|
  config.consumer_key = ENV['sg_consumer_key']
  config.consumer_secret = ENV['sg_consumer_secret']
  config.oauth_token = ENV['sg_oauth_token']
  config.oauth_token_secret = ENV['sg_oauth_token_secret']
  config.auth_method        = :oauth
end

TweetStream::Client.new.follow(1401150828, 281615153) do |status|
  shoutytweet = status.text.upcase  # Shoutify
  shoutytweet.slice! "@"            # Strip out @s
  Twitter.update(shoutytweet)       # Tweet
end