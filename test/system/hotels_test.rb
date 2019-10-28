require "application_system_test_case"

class HotelsTest < ApplicationSystemTestCase
  setup do
    @hotel = hotels(:one)
  end

  test "visiting the index" do
    visit hotels_url
    assert_selector "h1", text: "Hotels"
  end

  test "creating a Hotel" do
    visit hotels_url
    click_on "New Hotel"

    fill_in "Address", with: @hotel.address
    fill_in "Bedtype", with: @hotel.bedtype
    fill_in "Coordinates", with: @hotel.coordinates
    fill_in "Fromdate", with: @hotel.fromdate
    fill_in "Location", with: @hotel.location_id
    fill_in "Name", with: @hotel.name
    fill_in "Noofperson", with: @hotel.noofperson
    fill_in "Noofrooms", with: @hotel.noofrooms
    fill_in "Price", with: @hotel.price
    fill_in "Roomtype", with: @hotel.roomtype
    fill_in "Todate", with: @hotel.todate
    click_on "Create Hotel"

    assert_text "Hotel was successfully created"
    click_on "Back"
  end

  test "updating a Hotel" do
    visit hotels_url
    click_on "Edit", match: :first

    fill_in "Address", with: @hotel.address
    fill_in "Bedtype", with: @hotel.bedtype
    fill_in "Coordinates", with: @hotel.coordinates
    fill_in "Fromdate", with: @hotel.fromdate
    fill_in "Location", with: @hotel.location_id
    fill_in "Name", with: @hotel.name
    fill_in "Noofperson", with: @hotel.noofperson
    fill_in "Noofrooms", with: @hotel.noofrooms
    fill_in "Price", with: @hotel.price
    fill_in "Roomtype", with: @hotel.roomtype
    fill_in "Todate", with: @hotel.todate
    click_on "Update Hotel"

    assert_text "Hotel was successfully updated"
    click_on "Back"
  end

  test "destroying a Hotel" do
    visit hotels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hotel was successfully destroyed"
  end
end
