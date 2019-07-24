require 'test_helper'

class LanguageskillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @languageskill = languageskills(:one)
  end

  test "should get index" do
    get languageskills_url
    assert_response :success
  end

  test "should get new" do
    get new_languageskill_url
    assert_response :success
  end

  test "should create languageskill" do
    assert_difference('Languageskill.count') do
      post languageskills_url, params: { languageskill: { proficiency: @languageskill.proficiency, references: @languageskill.references, teaches: @languageskill.teaches } }
    end

    assert_redirected_to languageskill_url(Languageskill.last)
  end

  test "should show languageskill" do
    get languageskill_url(@languageskill)
    assert_response :success
  end

  test "should get edit" do
    get edit_languageskill_url(@languageskill)
    assert_response :success
  end

  test "should update languageskill" do
    patch languageskill_url(@languageskill), params: { languageskill: { proficiency: @languageskill.proficiency, references: @languageskill.references, teaches: @languageskill.teaches } }
    assert_redirected_to languageskill_url(@languageskill)
  end

  test "should destroy languageskill" do
    assert_difference('Languageskill.count', -1) do
      delete languageskill_url(@languageskill)
    end

    assert_redirected_to languageskills_url
  end
end
