require 'twitter'

namespace :twitter do

  desc "Tweet any users who have a bin collection in "
  task(:tweet => :environment) do
    collections = Collection.find.collect_soon(:include=>:users)
    for collection in collections
      for user in collection.users
        tweet = "@#{user.name} - Don't forget to put out your bin tonight!"
        Twitter::Base.new("aubergene+epicbin@gmail.com", TWITTER_PASSWORD).update(tweet)
      end
    end
  end

end
