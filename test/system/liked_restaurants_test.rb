require "application_system_test_case"

class LikedRestaurantsTest < ApplicationSystemTestCase
  setup do
    @liked_restaurant = liked_restaurants(:one)
  end

  test "visiting the index" do
    visit liked_restaurants_url
    assert_selector "h1", text: "Liked Restaurants"
  end

  test "creating a Liked restaurant" do
    visit liked_restaurants_url
    click_on "New Liked Restaurant"

    fill_in "Restaurant", with: @liked_restaurant.restaurant_id
    fill_in "User", with: @liked_restaurant.user_id
    click_on "Create Liked restaurant"

    assert_text "Liked restaurant was successfully created"
    click_on "Back"
  end

  test "updating a Liked restaurant" do
    visit liked_restaurants_url
    click_on "Edit", match: :first

    fill_in "Restaurant", with: @liked_restaurant.restaurant_id
    fill_in "User", with: @liked_restaurant.user_id
    click_on "Update Liked restaurant"

    assert_text "Liked restaurant was successfully updated"
    click_on "Back"
  end

  test "destroying a Liked restaurant" do
    visit liked_restaurants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Liked restaurant was successfully destroyed"
  end
end
