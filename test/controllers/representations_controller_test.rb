require 'test_helper'

class RepresentationsControllerTest < ActionController::TestCase
  setup do
    @representation = representations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:representations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create representation" do
    assert_difference('Representation.count') do
      post :create, representation: { cle: @representation.cle, endDate: @representation.endDate, endTime: @representation.endTime, name: @representation.name, startDate: @representation.startDate, startTime: @representation.startTime }
    end

    assert_redirected_to representation_path(assigns(:representation))
  end

  test "should show representation" do
    get :show, id: @representation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @representation
    assert_response :success
  end

  test "should update representation" do
    patch :update, id: @representation, representation: { cle: @representation.cle, endDate: @representation.endDate, endTime: @representation.endTime, name: @representation.name, startDate: @representation.startDate, startTime: @representation.startTime }
    assert_redirected_to representation_path(assigns(:representation))
  end

  test "should destroy representation" do
    assert_difference('Representation.count', -1) do
      delete :destroy, id: @representation
    end

    assert_redirected_to representations_path
  end
end
