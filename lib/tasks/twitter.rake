require 'twitter'

namespace :twitter do

  desc "Tweet any users who have a bin collection in "
  task(:tweet => :environment) do
    collections = Collection.today.all(:include=>:user)
    for collection in collections
      sleep(TWEET_DELAY) # don't hit Twitter too frequently or it might get upset
      tweet = "@#{collection.user.twitter_username} - Don't forget to put out your bin tonight for #{collection.name}! #epicbin"
      puts tweet
#        Twitter::Base.new("aubergene+epicbin@gmail.com", TWITTER_PASSWORD).update(tweet)
    end
  end

end
