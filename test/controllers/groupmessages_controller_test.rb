require 'test_helper'

class GroupmessagesControllerTest < ActionController::TestCase
  setup do
    @groupmessage = groupmessages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groupmessages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create groupmessage" do
    assert_difference('Groupmessage.count') do
      post :create, groupmessage: { body: @groupmessage.body, group_id: @groupmessage.group_id, title: @groupmessage.title, user_id: @groupmessage.user_id }
    end

    assert_redirected_to groupmessage_path(assigns(:groupmessage))
  end

  test "should show groupmessage" do
    get :show, id: @groupmessage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @groupmessage
    assert_response :success
  end

  test "should update groupmessage" do
    patch :update, id: @groupmessage, groupmessage: { body: @groupmessage.body, group_id: @groupmessage.group_id, title: @groupmessage.title, user_id: @groupmessage.user_id }
    assert_redirected_to groupmessage_path(assigns(:groupmessage))
  end

  test "should destroy groupmessage" do
    assert_difference('Groupmessage.count', -1) do
      delete :destroy, id: @groupmessage
    end

    assert_redirected_to groupmessages_path
  end
end
