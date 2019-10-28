require "application_system_test_case"

class LikedHotelsTest < ApplicationSystemTestCase
  setup do
    @liked_hotel = liked_hotels(:one)
  end

  test "visiting the index" do
    visit liked_hotels_url
    assert_selector "h1", text: "Liked Hotels"
  end

  test "creating a Liked hotel" do
    visit liked_hotels_url
    click_on "New Liked Hotel"

    fill_in "Hotel", with: @liked_hotel.hotel_id
    fill_in "User", with: @liked_hotel.user_id
    click_on "Create Liked hotel"

    assert_text "Liked hotel was successfully created"
    click_on "Back"
  end

  test "updating a Liked hotel" do
    visit liked_hotels_url
    click_on "Edit", match: :first

    fill_in "Hotel", with: @liked_hotel.hotel_id
    fill_in "User", with: @liked_hotel.user_id
    click_on "Update Liked hotel"

    assert_text "Liked hotel was successfully updated"
    click_on "Back"
  end

  test "destroying a Liked hotel" do
    visit liked_hotels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Liked hotel was successfully destroyed"
  end
end
