require 'test_helper'

class GroupimagesControllerTest < ActionController::TestCase
  setup do
    @groupimage = groupimages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groupimages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create groupimage" do
    assert_difference('Groupimage.count') do
      post :create, groupimage: { desc: @groupimage.desc, group_id: @groupimage.group_id }
    end

    assert_redirected_to groupimage_path(assigns(:groupimage))
  end

  test "should show groupimage" do
    get :show, id: @groupimage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @groupimage
    assert_response :success
  end

  test "should update groupimage" do
    patch :update, id: @groupimage, groupimage: { desc: @groupimage.desc, group_id: @groupimage.group_id }
    assert_redirected_to groupimage_path(assigns(:groupimage))
  end

  test "should destroy groupimage" do
    assert_difference('Groupimage.count', -1) do
      delete :destroy, id: @groupimage
    end

    assert_redirected_to groupimages_path
  end
end
