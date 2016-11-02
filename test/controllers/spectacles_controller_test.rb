require 'test_helper'

class SpectaclesControllerTest < ActionController::TestCase
  setup do
    @spectacle = spectacles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spectacles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spectacle" do
    assert_difference('Spectacle.count') do
      post :create, spectacle: { cle: @spectacle.cle, name: @spectacle.name }
    end

    assert_redirected_to spectacle_path(assigns(:spectacle))
  end

  test "should show spectacle" do
    get :show, id: @spectacle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spectacle
    assert_response :success
  end

  test "should update spectacle" do
    patch :update, id: @spectacle, spectacle: { cle: @spectacle.cle, name: @spectacle.name }
    assert_redirected_to spectacle_path(assigns(:spectacle))
  end

  test "should destroy spectacle" do
    assert_difference('Spectacle.count', -1) do
      delete :destroy, id: @spectacle
    end

    assert_redirected_to spectacles_path
  end
end
