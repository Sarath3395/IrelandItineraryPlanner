require 'nokogiri'
require 'watir'
require 'open-uri'

class TransportScrapper

def self.scrapewithtime(value, time)
@browser.goto value
puts value
#doc = Nokogiri::HTML.parse(open(value))
doc = Nokogiri::HTML.parse(@browser.html)
#taking all the hotels list in HTML
puts "---------------doc-----------"
puts doc
onwardtransport_snip = doc.search('div#JourneyRowsOut')
onwardtransport_snip_Full= onwardtransport_snip.css('div.fullTable')
onwardtransport_snip_array = onwardtransport_snip_Full.css('div.tableDataRow.Divtrue')

puts onwardtransport_snip_array

#iterating over each hotel
onwardtransport_snip_array.each do |transport_elemets|
	depart=	transport_elemets.css('div.tableDataTime.d-T').text.strip!
	arrival=transport_elemets.css('div.tableDataTime').text.strip!
	
	route_element=transport_elemets.css('div.tableRowSelector')
	route=route_element.css('div.tableData').text.strip!
	price_element=	transport_elemets.css('div.tableDataFare')
	price=	price_element.css('span.tablePrice').text
	
	if arrival
	arrivalArr=arrival.split(':')
	val1 = arrivalArr[1].split(//).last(2).join
	val2=	arrivalArr[2].split(//).first(2).join
	arrival ="#{val1}:#{val2}"
	end
	
	
	if price
	price.slice! "\u20AC"
	end
	
	if route
	route=route.gsub(" ","")
	route=route.gsub("\n","")
	end
		
	#new Hash is created and all the values are pushed into the hash map
	output = Hash.new
	output.store("depart", depart)
	output.store("arrival", arrival)
	output.store("price", price)
	output.store("route",route)
	output.store("id", "#{depart}_#{arrival}_#{route}")
	

#pushing to array

if(!@outwardArr.include?(output))
	@outwardArr.push(output)
end
   end




#taking all the hotels list in HTML
returntransport_snip = doc.search('div#JourneyRowsRet')
returntransport_snip_Full= returntransport_snip.css('div.fullTable')
returntransport_snip_array = returntransport_snip_Full.css('div.tableDataRow.Divtrue')


#iterating over each hotel
returntransport_snip_array.each do |transport_elemets|
	depart=	transport_elemets.css('div.tableDataTime.d-T').text.strip!
	arrival=	transport_elemets.css('div.tableDataTime').text.strip!
	route_element=transport_elemets.css('div.tableRowSelector')
	route=route_element.css('div.tableData').text.strip!
	price_element=	transport_elemets.css('div.tableDataFare')
	price=	price_element.css('span.tablePrice').text
	
	if arrival
	arrivalArr=arrival.split(':')
	val1 = arrivalArr[1].split(//).last(2).join
	val2=	arrivalArr[2].split(//).first(2).join
	arrival ="#{val1}:#{val2}"
	end
	
	if price
	price.slice! "\u20AC"
	end
	
	if route
	route=route.gsub(" ","")
	route=route.gsub("\n","")
	end
		
	#new Hash is created and all the values are pushed into the hash map
	output = Hash.new
	output.store("depart", depart)
	output.store("arrival", arrival)
	output.store("price", price)
	output.store("route",route)
	output.store("id", "#{depart}_#{arrival}_#{route}")

#pushing to array

if(!@returnArr.include?(output))
	@returnArr.push(output)
end
   end

puts '----------------------------------------------------------------------------'
puts @outwardArr
puts @returnArr
puts '----------------------------------------------------------------------------'

end

def self.scrape(value)

@outwardArr = []
@returnArr = []

args = %w[--disable-infobars --headless window-size=1600,1200 --no-sandbox --disable-gpu --disable-dev-shm-usage]
options = {
       binary: ENV['GOOGLE_CHROME_BIN'],
       prefs: { password_manager_enable: false, credentials_enable_service: false },
       args:  args
     }

@browser = Watir::Browser.new(:chrome, options: options)

timeArr = ["0000","0400","0800","1200","1600","2000"]

for time in timeArr do
	temp = value 
  joinstr ="&returntime=#{time}&departtime=#{time}"
  temp = value+joinstr
 
  self.scrapewithtime(temp, time)
end

  #returning array
  result = Hash.new
  result.store("outward" ,@outwardArr)
  result.store("return" ,@returnArr)
  
return result

end 
vv = "https://national.buseireann.ie/?originStop=13500&destinationstop=55504&ticketType=2&departdate=11-dec-2019&returndate=12-dec-2019&adult=1&child=0&student=0&family=0"
res = TransportScrapper.scrape(vv)

puts res 

end

