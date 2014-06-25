require 'test_helper'

class GroupIntsControllerTest < ActionController::TestCase
  setup do
    @group_int = group_ints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_ints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_int" do
    assert_difference('GroupInt.count') do
      post :create, group_int: { dt: @group_int.dt, location: @group_int.location, user_id_id: @group_int.user_id_id }
    end

    assert_redirected_to group_int_path(assigns(:group_int))
  end

  test "should show group_int" do
    get :show, id: @group_int
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_int
    assert_response :success
  end

  test "should update group_int" do
    patch :update, id: @group_int, group_int: { dt: @group_int.dt, location: @group_int.location, user_id_id: @group_int.user_id_id }
    assert_redirected_to group_int_path(assigns(:group_int))
  end

  test "should destroy group_int" do
    assert_difference('GroupInt.count', -1) do
      delete :destroy, id: @group_int
    end

    assert_redirected_to group_ints_path
  end
end
