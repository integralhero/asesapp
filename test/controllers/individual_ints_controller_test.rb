require 'test_helper'

class IndividualIntsControllerTest < ActionController::TestCase
  setup do
    @individual_int = individual_ints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:individual_ints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create individual_int" do
    assert_difference('IndividualInt.count') do
      post :create, individual_int: { dt: @individual_int.dt, location: @individual_int.location, user_id_id: @individual_int.user_id_id }
    end

    assert_redirected_to individual_int_path(assigns(:individual_int))
  end

  test "should show individual_int" do
    get :show, id: @individual_int
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @individual_int
    assert_response :success
  end

  test "should update individual_int" do
    patch :update, id: @individual_int, individual_int: { dt: @individual_int.dt, location: @individual_int.location, user_id_id: @individual_int.user_id_id }
    assert_redirected_to individual_int_path(assigns(:individual_int))
  end

  test "should destroy individual_int" do
    assert_difference('IndividualInt.count', -1) do
      delete :destroy, id: @individual_int
    end

    assert_redirected_to individual_ints_path
  end
end
