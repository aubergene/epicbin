require 'rubygems'
require 'hpricot'
require 'open-uri'

module Postcode

POSTCODE_REGX = \
/\b(
( # begin postal district group
(?:[BEGLMNS][1-9]\d?) |
(?:W[2-9]) |
(?:
(?:A[BL] |
B[ABDHLNRST] |
C[ABFHMORTVW] |
D[ADEGHLNTY] |
E[HNX] |
F[KY] |
G[LUY] |
H[ADGPRSUX] |
I[GMPV] |
JE |
K[ATWY] |
L[ADELNSU] |
M[EKL] |
N[EGNPRW] |
O[LX] |
P[AEHLOR] |
R[GHM] |
S[AEGKL-PRSTWY] |
T[ADFNQRSW] |
UB |
W[ADFNRSV] |
YO |
ZE)
\d\d?) |
(?:[EW]1[A-HJKSTUW0-9]) |
(?:(?:(?:WC[1-2]) |
(?:EC[1-4]) |
(?:SW1))[ABEHMNPRVWXY]?)
) # end postal district group
(?:\s*)?
([0-9][ABD-HJLNP-UW-Z]{2})
) # end complete group
/ix


  def self.extract_postcode(text)
#-    text = text.gsub(/o/i,'0') # replace o with zero
    return unless text
    postcode = text.scan(POSTCODE_REGX).flatten.first.to_s
    if postcode and postcode != ""
      postcode.insert(-4,' ').sub(/\s+/,' ').upcase
    end
  end

  def postcode_to_council(postcode)
    doc = Hpricot(open("http://www.writetothem.com/who?pc=#{postcode}"))
    (doc/"td.firstcol p").inner_html.scan(/represent you on (?:the)?([^\.]+)./).to_s
  end

end
