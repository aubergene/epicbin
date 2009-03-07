require 'twitter'

namespace :twitter do

  desc "Tweet any users who have a bin collection in "
  task(:tweet => :environment) do
    collections = Collection.find.collect_soon(:include=>:users)
    for collection in collections
      for user in collection.users
        sleep(TWEET_DELAY) # don't hit Twitter too frequently or it might get upset
        tweet = "@#{user.name} - Don't forget to put out your bin tonight for #{collection.name}! #epicbin"
        Twitter::Base.new("aubergene+epicbin@gmail.com", TWITTER_PASSWORD).update(tweet)
      end
    end
  end

end
