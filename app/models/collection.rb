class Collection < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :time, :type, :user_id


end
