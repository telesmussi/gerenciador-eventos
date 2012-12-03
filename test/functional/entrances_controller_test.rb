require 'test_helper'

class EntrancesControllerTest < ActionController::TestCase
  setup do
    @entrance = entrances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entrances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entrance" do
    assert_difference('Entrance.count') do
      post :create, entrance: { was_allowed: @entrance.was_allowed }
    end

    assert_redirected_to entrance_path(assigns(:entrance))
  end

  test "should show entrance" do
    get :show, id: @entrance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entrance
    assert_response :success
  end

  test "should update entrance" do
    put :update, id: @entrance, entrance: { was_allowed: @entrance.was_allowed }
    assert_redirected_to entrance_path(assigns(:entrance))
  end

  test "should destroy entrance" do
    assert_difference('Entrance.count', -1) do
      delete :destroy, id: @entrance
    end

    assert_redirected_to entrances_path
  end
end
