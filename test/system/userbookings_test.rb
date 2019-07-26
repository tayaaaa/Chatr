require "application_system_test_case"

class UserbookingsTest < ApplicationSystemTestCase
  setup do
    @userbooking = userbookings(:one)
  end

  test "visiting the index" do
    visit userbookings_url
    assert_selector "h1", text: "Userbookings"
  end

  test "creating a Userbooking" do
    visit userbookings_url
    click_on "New Userbooking"

    check "Completedstu" if @userbooking.completedstu
    check "Completedteach" if @userbooking.completedteach
    fill_in "Date booked", with: @userbooking.date_booked
    fill_in "Lesson", with: @userbooking.lesson_id
    fill_in "Note", with: @userbooking.note
    fill_in "Student", with: @userbooking.student_id
    click_on "Create Userbooking"

    assert_text "Userbooking was successfully created"
    click_on "Back"
  end

  test "updating a Userbooking" do
    visit userbookings_url
    click_on "Edit", match: :first

    check "Completedstu" if @userbooking.completedstu
    check "Completedteach" if @userbooking.completedteach
    fill_in "Date booked", with: @userbooking.date_booked
    fill_in "Lesson", with: @userbooking.lesson_id
    fill_in "Note", with: @userbooking.note
    fill_in "Student", with: @userbooking.student_id
    click_on "Update Userbooking"

    assert_text "Userbooking was successfully updated"
    click_on "Back"
  end

  test "destroying a Userbooking" do
    visit userbookings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Userbooking was successfully destroyed"
  end
end
