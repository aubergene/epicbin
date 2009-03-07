require 'rubygems'
require 'hpricot'
require 'open-uri'

class PostcodeToCouncil

  def self.get(postcode)
    doc = Hpricot(open("http://www.writetothem.com/who?pc=#{postcode}"))
    (doc/"td.firstcol p").inner_html.scan(/represent you on (?:the)?([^\.]+)./).to_s
  end

end
