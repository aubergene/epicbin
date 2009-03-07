class EpicbinController < ApplicationController

    def index
        
    end

    def submit
        @user = User.new do |u|
        end
    end
end
