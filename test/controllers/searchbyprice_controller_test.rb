require 'minitest/autorun'
require 'test_helper'

class SearchbypriceControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end


  test "sorting transport checking true" do

   likedTransports= [transports(:four), transports(:six)]

	scrappedinput = [{"depart"=>"10:30", "arrival"=>"14:10", "price"=>"10.92", "route"=>"20", "id"=>"10:30_14:10_20", "when"=>"late morning"},
 {"depart"=>"23:00", "arrival"=>"02:15", "price"=>"10.92", "route"=>"X20", "id"=>"23:00_02:15_X20", "when"=>"night"},
 {"depart"=>"14:30", "arrival"=>"17:45", "price"=>"10.92", "route"=>"X20", "id"=>"14:30_17:45_X20", "when"=>"after noon"},
 {"depart"=>"15:30", "arrival"=>"18:45", "price"=>"10.92", "route"=>"X20", "id"=>"15:30_18:45_X20", "when"=>"after noon"},
 {"depart"=>"20:30", "arrival"=>"00:10", "price"=>"10.92", "route"=>"20", "id"=>"20:30_00:10_20", "when"=>"night"},
 {"depart"=>"16:30", "arrival"=>"20:10", "price"=>"10.92", "route"=>"20", "id"=>"16:30_20:10_20", "when"=>"evening"}]


expectedoutput = [ {"depart"=>"23:00", "arrival"=>"02:15", "price"=>"10.92", "route"=>"X20", "id"=>"23:00_02:15_X20", "when"=>"night"},
 {"depart"=>"20:30", "arrival"=>"00:10", "price"=>"10.92", "route"=>"20", "id"=>"20:30_00:10_20", "when"=>"night"},
 {"depart"=>"10:30", "arrival"=>"14:10", "price"=>"10.92", "route"=>"20", "id"=>"10:30_14:10_20", "when"=>"late morning"},
 {"depart"=>"14:30", "arrival"=>"17:45", "price"=>"10.92", "route"=>"X20", "id"=>"14:30_17:45_X20", "when"=>"after noon"},
 {"depart"=>"15:30", "arrival"=>"18:45", "price"=>"10.92", "route"=>"X20", "id"=>"15:30_18:45_X20", "when"=>"after noon"},
 {"depart"=>"16:30", "arrival"=>"20:10", "price"=>"10.92", "route"=>"20", "id"=>"16:30_20:10_20", "when"=>"evening"}]

	assert_equal(expectedoutput, SearchbypriceController.sortingtransport(likedTransports,scrappedinput))
  end

  test "sorting restaurant checking true" do
  	
   likedRestaurants= [restaurants(:one), restaurants(:two),restaurants(:three), restaurants(:four),restaurants(:five)]

	scrappedinput = [{"name"=>"Tang Cafe", "type"=>"European", "range"=>"1", "economy"=>"cheap"},
{"name"=>"PHX Bistro", "type"=>"Irish", "range"=>"2-3", "economy"=>"cheap"},
{"name"=>"Dax Restaurant", "type"=>"French", "range"=>"4", "economy"=>"expensive"}, 
{"name"=>"Crow Street Restaurant", "type"=>"European", "range"=>"2-3", "economy"=>"average"},
{"name"=>"Gerry's Coffee Shop", "type"=>"Cafe", "range"=>"1", "economy"=>"cheap"},
{"name"=>"Taza", "type"=>"Indian", "range"=>"2-3", "economy"=>"average"},
{"name"=>"Tippenyaki Restaurant", "type"=>"European", "range"=>"2-3", "economy"=>"expensive"}]


expectedoutput = [{"name"=>"Crow Street Restaurant", "type"=>"European", "range"=>"2-3", "economy"=>"average"},
{"name"=>"Tippenyaki Restaurant", "type"=>"European", "range"=>"2-3", "economy"=>"expensive"},
{"name"=>"Taza", "type"=>"Indian", "range"=>"2-3", "economy"=>"average"},
{"name"=>"Tang Cafe", "type"=>"European", "range"=>"1", "economy"=>"cheap"},
{"name"=>"Dax Restaurant", "type"=>"French", "range"=>"4", "economy"=>"expensive"},
{"name"=>"PHX Bistro", "type"=>"Irish", "range"=>"2-3", "economy"=>"cheap"},
{"name"=>"Gerry's Coffee Shop", "type"=>"Cafe", "range"=>"1", "economy"=>"cheap"}]

	assert_equal(expectedoutput, SearchbypriceController.sortingrestaurant(likedRestaurants,scrappedinput))
  end


    test "sorting hotel checking true" do
  	
   likedHotels= [hotels(:one)]

	scrappedinput =  [{"name"=>"Imperial Hotel Cork City", "rank"=>"8.7", "location"=>"-8.47006738185883,51.8971251859727", "address"=>"Cork", "roomtype"=>"NA", "bedtype"=>"1 full bed", "price"=>"166", "fromdate"=>"2019-12-18", "todate"=>"2019-12-19", "noofpersons"=>"1", "location_id"=>5},
	 {"name"=>"Maldron Hotel South Mall Cork City", "rank"=>"9.1", "location"=>"-8.4677986633377,51.897853725061", "address"=>"Cork", "roomtype"=>"NA", "bedtype"=>"2 full beds", "price"=>"156", "fromdate"=>"2019-12-18", "todate"=>"2019-12-19", "noofpersons"=>"1", "location_id"=>5},
	 {"name"=>"The River Lee Hotel a member of The Doyle Collection", "rank"=>"9.2", "location"=>"-6.22489482164383,53.3257877768286", "address"=>"Cork", "roomtype"=>"NA", "bedtype"=>"2 full beds", "price"=>"161", "fromdate"=>"2019-12-18", "todate"=>"2019-12-19", "noofpersons"=>"1", "location_id"=>5},
	 {"name"=>"The Grafton Hotel", "rank"=>"9.3", "location"=>"-6.2637392687684,53.341008813861", "address"=>"Saint Stephen's Green, Dublin", "roomtype"=>"NA", "bedtype"=>"1 king bed", "price"=>"161", "fromdate"=>"2019-12-18", "todate"=>"2019-12-19", "noofpersons"=>"1", "location_id"=>3}]


expectedoutput = [{"name"=>"The River Lee Hotel a member of The Doyle Collection", "rank"=>"9.2", "location"=>"-6.22489482164383,53.3257877768286", "address"=>"Cork", "roomtype"=>"NA", "bedtype"=>"2 full beds", "price"=>"161", "fromdate"=>"2019-12-18", "todate"=>"2019-12-19", "noofpersons"=>"1", "location_id"=>5},
		 {"name"=>"Imperial Hotel Cork City", "rank"=>"8.7", "location"=>"-8.47006738185883,51.8971251859727", "address"=>"Cork", "roomtype"=>"NA", "bedtype"=>"1 full bed", "price"=>"166", "fromdate"=>"2019-12-18", "todate"=>"2019-12-19", "noofpersons"=>"1", "location_id"=>5},
		 {"name"=>"Maldron Hotel South Mall Cork City", "rank"=>"9.1", "location"=>"-8.4677986633377,51.897853725061", "address"=>"Cork", "roomtype"=>"NA", "bedtype"=>"2 full beds", "price"=>"156", "fromdate"=>"2019-12-18", "todate"=>"2019-12-19", "noofpersons"=>"1", "location_id"=>5},
		 {"name"=>"The Grafton Hotel", "rank"=>"9.3", "location"=>"-6.2637392687684,53.341008813861", "address"=>"Saint Stephen's Green, Dublin", "roomtype"=>"NA", "bedtype"=>"1 king bed", "price"=>"161", "fromdate"=>"2019-12-18", "todate"=>"2019-12-19", "noofpersons"=>"1", "location_id"=>3}]

	assert_equal(expectedoutput, SearchbypriceController.sortinghotels(likedHotels,scrappedinput))
  end
end
