require "application_system_test_case"

class TransportsTest < ApplicationSystemTestCase
  setup do
    @transport = transports(:one)
  end

  test "visiting the index" do
    visit transports_url
    assert_selector "h1", text: "Transports"
  end

  test "creating a Transport" do
    visit transports_url
    click_on "New Transport"

    fill_in "Arrival", with: @transport.arrival
    fill_in "Departure", with: @transport.departure
    fill_in "Destination", with: @transport.destination
    fill_in "Location", with: @transport.location_id
    fill_in "Name", with: @transport.name
    fill_in "Origin", with: @transport.origin
    fill_in "Price", with: @transport.price
    fill_in "Type", with: @transport.type
    click_on "Create Transport"

    assert_text "Transport was successfully created"
    click_on "Back"
  end

  test "updating a Transport" do
    visit transports_url
    click_on "Edit", match: :first

    fill_in "Arrival", with: @transport.arrival
    fill_in "Departure", with: @transport.departure
    fill_in "Destination", with: @transport.destination
    fill_in "Location", with: @transport.location_id
    fill_in "Name", with: @transport.name
    fill_in "Origin", with: @transport.origin
    fill_in "Price", with: @transport.price
    fill_in "Type", with: @transport.type
    click_on "Update Transport"

    assert_text "Transport was successfully updated"
    click_on "Back"
  end

  test "destroying a Transport" do
    visit transports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transport was successfully destroyed"
  end
end
