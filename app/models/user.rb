class User < ActiveRecord::Base
  include Postcode

  has_many :collections

  validates_presence_of :twitter_username
  validates_format_of :postcode, :with=> Postcode::POSTCODE_REGX

  def after_validation
    self.postcode = Postcode.extract_postcode(postcode)
  end


end
