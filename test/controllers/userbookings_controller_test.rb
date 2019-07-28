require 'test_helper'

class UserbookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @userbooking = userbookings(:one)
  end

  test "should get index" do
    get userbookings_url
    assert_response :success
  end

  test "should get new" do
    get new_userbooking_url
    assert_response :success
  end

  test "should create userbooking" do
    assert_difference('Userbooking.count') do
      post userbookings_url, params: { userbooking: { completedstu: @userbooking.completedstu, completedteach: @userbooking.completedteach, date_booked: @userbooking.date_booked, lesson_id: @userbooking.lesson_id, note: @userbooking.note, student_id: @userbooking.student_id } }
    end

    assert_redirected_to userbooking_url(Userbooking.last)
  end

  test "should show userbooking" do
    get userbooking_url(@userbooking)
    assert_response :success
  end

  test "should get edit" do
    get edit_userbooking_url(@userbooking)
    assert_response :success
  end

  test "should update userbooking" do
    patch userbooking_url(@userbooking), params: { userbooking: { completedstu: @userbooking.completedstu, completedteach: @userbooking.completedteach, date_booked: @userbooking.date_booked, lesson_id: @userbooking.lesson_id, note: @userbooking.note, student_id: @userbooking.student_id } }
    assert_redirected_to userbooking_url(@userbooking)
  end

  test "should destroy userbooking" do
    assert_difference('Userbooking.count', -1) do
      delete userbooking_url(@userbooking)
    end

    assert_redirected_to userbookings_url
  end
end
