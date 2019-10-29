require "application_system_test_case"

class LikedTransportsTest < ApplicationSystemTestCase
  setup do
    @liked_transport = liked_transports(:one)
  end

  test "visiting the index" do
    visit liked_transports_url
    assert_selector "h1", text: "Liked Transports"
  end

  test "creating a Liked transport" do
    visit liked_transports_url
    click_on "New Liked Transport"

    fill_in "Transport", with: @liked_transport.transport_id
    fill_in "User", with: @liked_transport.user_id
    click_on "Create Liked transport"

    assert_text "Liked transport was successfully created"
    click_on "Back"
  end

  test "updating a Liked transport" do
    visit liked_transports_url
    click_on "Edit", match: :first

    fill_in "Transport", with: @liked_transport.transport_id
    fill_in "User", with: @liked_transport.user_id
    click_on "Update Liked transport"

    assert_text "Liked transport was successfully updated"
    click_on "Back"
  end

  test "destroying a Liked transport" do
    visit liked_transports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Liked transport was successfully destroyed"
  end
end
