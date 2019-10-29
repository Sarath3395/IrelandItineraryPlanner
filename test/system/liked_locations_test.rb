require "application_system_test_case"

class LikedLocationsTest < ApplicationSystemTestCase
  setup do
    @liked_location = liked_locations(:one)
  end

  test "visiting the index" do
    visit liked_locations_url
    assert_selector "h1", text: "Liked Locations"
  end

  test "creating a Liked location" do
    visit liked_locations_url
    click_on "New Liked Location"

    fill_in "Location", with: @liked_location.location_id
    fill_in "User", with: @liked_location.user_id
    click_on "Create Liked location"

    assert_text "Liked location was successfully created"
    click_on "Back"
  end

  test "updating a Liked location" do
    visit liked_locations_url
    click_on "Edit", match: :first

    fill_in "Location", with: @liked_location.location_id
    fill_in "User", with: @liked_location.user_id
    click_on "Update Liked location"

    assert_text "Liked location was successfully updated"
    click_on "Back"
  end

  test "destroying a Liked location" do
    visit liked_locations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Liked location was successfully destroyed"
  end
end
