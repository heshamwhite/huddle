require 'test_helper'

class EventcommentsControllerTest < ActionController::TestCase
  setup do
    @eventcomment = eventcomments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eventcomments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eventcomment" do
    assert_difference('Eventcomment.count') do
      post :create, eventcomment: { body: @eventcomment.body, event_id: @eventcomment.event_id, user_id: @eventcomment.user_id }
    end

    assert_redirected_to eventcomment_path(assigns(:eventcomment))
  end

  test "should show eventcomment" do
    get :show, id: @eventcomment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @eventcomment
    assert_response :success
  end

  test "should update eventcomment" do
    patch :update, id: @eventcomment, eventcomment: { body: @eventcomment.body, event_id: @eventcomment.event_id, user_id: @eventcomment.user_id }
    assert_redirected_to eventcomment_path(assigns(:eventcomment))
  end

  test "should destroy eventcomment" do
    assert_difference('Eventcomment.count', -1) do
      delete :destroy, id: @eventcomment
    end

    assert_redirected_to eventcomments_path
  end
end
