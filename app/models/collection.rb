class Collection < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :dow, :name, :user_id

  named_scope :today, :conditions => { :dow => Time.now.wday }


end
