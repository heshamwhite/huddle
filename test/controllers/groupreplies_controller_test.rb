require 'test_helper'

class GrouprepliesControllerTest < ActionController::TestCase
  setup do
    @groupreply = groupreplies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groupreplies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create groupreply" do
    assert_difference('Groupreply.count') do
      post :create, groupreply: { body: @groupreply.body, groupmessage_id: @groupreply.groupmessage_id, user_id: @groupreply.user_id }
    end

    assert_redirected_to groupreply_path(assigns(:groupreply))
  end

  test "should show groupreply" do
    get :show, id: @groupreply
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @groupreply
    assert_response :success
  end

  test "should update groupreply" do
    patch :update, id: @groupreply, groupreply: { body: @groupreply.body, groupmessage_id: @groupreply.groupmessage_id, user_id: @groupreply.user_id }
    assert_redirected_to groupreply_path(assigns(:groupreply))
  end

  test "should destroy groupreply" do
    assert_difference('Groupreply.count', -1) do
      delete :destroy, id: @groupreply
    end

    assert_redirected_to groupreplies_path
  end
end
