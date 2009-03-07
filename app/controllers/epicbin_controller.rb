class EpicbinController < ApplicationController

  def check
    if user = User.create(:twitter_username=>params[:twitter_username])
      render :text=>user.inspect
    else
      render :index
    end
  end

end
