require "application_system_test_case"

class UserFollowingsTest < ApplicationSystemTestCase
  setup do
    @user_following = user_followings(:one)
  end

  test "visiting the index" do
    visit user_followings_url
    assert_selector "h1", text: "User Followings"
  end

  test "creating a User following" do
    visit user_followings_url
    click_on "New User Following"

    fill_in "Follow", with: @user_following.follow_id
    fill_in "Question", with: @user_following.question_id
    fill_in "User", with: @user_following.user_id
    click_on "Create User following"

    assert_text "User following was successfully created"
    click_on "Back"
  end

  test "updating a User following" do
    visit user_followings_url
    click_on "Edit", match: :first

    fill_in "Follow", with: @user_following.follow_id
    fill_in "Question", with: @user_following.question_id
    fill_in "User", with: @user_following.user_id
    click_on "Update User following"

    assert_text "User following was successfully updated"
    click_on "Back"
  end

  test "destroying a User following" do
    visit user_followings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User following was successfully destroyed"
  end
end
