require "application_system_test_case"

class NitrogensTest < ApplicationSystemTestCase
  setup do
    @nitrogen = nitrogens(:one)
  end

  test "visiting the index" do
    visit nitrogens_url
    assert_selector "h1", text: "Nitrogens"
  end

  test "creating a Nitrogen" do
    visit nitrogens_url
    click_on "New Nitrogen"

    fill_in "Email", with: @nitrogen.email
    fill_in "Phone", with: @nitrogen.phone
    fill_in "Twitter", with: @nitrogen.twitter
    fill_in "User name", with: @nitrogen.user_name
    click_on "Create Nitrogen"

    assert_text "Nitrogen was successfully created"
    click_on "Back"
  end

  test "updating a Nitrogen" do
    visit nitrogens_url
    click_on "Edit", match: :first

    fill_in "Email", with: @nitrogen.email
    fill_in "Phone", with: @nitrogen.phone
    fill_in "Twitter", with: @nitrogen.twitter
    fill_in "User name", with: @nitrogen.user_name
    click_on "Update Nitrogen"

    assert_text "Nitrogen was successfully updated"
    click_on "Back"
  end

  test "destroying a Nitrogen" do
    visit nitrogens_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nitrogen was successfully destroyed"
  end
end
