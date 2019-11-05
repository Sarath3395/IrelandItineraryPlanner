require 'nokogiri'
require 'watir'

class BookingScrapper

def self.scrape(value)
  
outputArray = []

args = %w[--disable-infobars --headless window-size=1600,1200 --no-sandbox --disable-gpu --disable-dev-shm-usage]
options = {
       binary: ENV['GOOGLE_CHROME_BIN'],
       prefs: { password_manager_enable: false, credentials_enable_service: false },
       args:  args
     }

browser = Watir::Browser.new(:chrome, options: options)
browser.goto value
doc = Nokogiri::HTML.parse(browser.html)

#taking all the hotels list in HTML
hotel_list_snippets = doc.css('div.sr_item.sr_item_new.sr_item_default.sr_property_block')

#iterating over each hotel
hotel_list_snippets.each do |hotel_elements|

	hotel_name=	hotel_elements.search('span.sr-hotel__name').text.strip!
	hotel_rank= hotel_elements.search('div.bui-review-score__badge').text.strip!
	
	location_doc = hotel_elements.css('div.sr_card_address_line')
	hotel_location = location_doc.search('a.bui-link').attribute('data-coords').value
	hotel_address = location_doc.search('a').text.strip!
	
	roomtype_doc =hotel_elements.css('a.room_link')
	hotel_roomtype=	roomtype_doc.at('strong')
	
	#some hotel does not have this tag, and result will be Nil, so here its checking for Nil
	if hotel_roomtype
	hotel_roomtype=	roomtype_doc.at('strong').text
	
	end
	
	bedtype_doc =hotel_elements.css('span.room_info')
	hotel_bedtype=	bedtype_doc.search('span.sr_gr_bed_type').text.strip!
	
	hotel_price= hotel_elements.search('div.bui-price-display__value.prco-inline-block-maker-helper').text.strip!

	
	hotel_name = hotel_name
	hotel_rank = hotel_rank
	hotel_location = hotel_location
	
	#removing Show on map string before that its checking for Nil value
	if hotel_address
	hotel_address.slice! "Show on map"
	hotel_address= hotel_address.strip!
	end
	
	#checking for Nil value
	if hotel_roomtype
	hotel_roomtype.gsub("\n","")
	end
	
	#checking for Nil Value
	if hotel_bedtype
	hotel_bedtype.gsub("\n","")
	end
	
	#checking for Nil Value
	if hotel_price
	hotel_price.slice! "\u20AC\u00A0"
	end
	
	#new Hash is created and all the values are pushed into the hash map
	output = Hash.new
	output.store("name", hotel_name)
	output.store("rank", hotel_rank)
	output.store("location", hotel_location)
	output.store("address", hotel_address)
	output.store("roomtype", hotel_roomtype)
	output.store("bedtype", hotel_bedtype)
	output.store("price", hotel_price)

#pushing to array
	outputArray.push(output)
	
   end
  #returning array
return outputArray

end

end