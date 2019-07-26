require "application_system_test_case"

class LanguageskillsTest < ApplicationSystemTestCase
  setup do
    @languageskill = languageskills(:one)
  end

  test "visiting the index" do
    visit languageskills_url
    assert_selector "h1", text: "Languageskills"
  end

  test "creating a Languageskill" do
    visit languageskills_url
    click_on "New Languageskill"

    fill_in "Proficiency", with: @languageskill.proficiency
    fill_in "References", with: @languageskill.references
    check "Teaches" if @languageskill.teaches
    click_on "Create Languageskill"

    assert_text "Languageskill was successfully created"
    click_on "Back"
  end

  test "updating a Languageskill" do
    visit languageskills_url
    click_on "Edit", match: :first

    fill_in "Proficiency", with: @languageskill.proficiency
    fill_in "References", with: @languageskill.references
    check "Teaches" if @languageskill.teaches
    click_on "Update Languageskill"

    assert_text "Languageskill was successfully updated"
    click_on "Back"
  end

  test "destroying a Languageskill" do
    visit languageskills_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Languageskill was successfully destroyed"
  end
end
