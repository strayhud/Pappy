require 'test_helper'

class QformsControllerTest < ActionController::TestCase
  setup do
    @qform = qforms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qforms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qform" do
    assert_difference('Qform.count') do
      post :create, :qform => @qform.attributes
    end

    assert_redirected_to qform_path(assigns(:qform))
  end

  test "should show qform" do
    get :show, :id => @qform.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @qform.to_param
    assert_response :success
  end

  test "should update qform" do
    put :update, :id => @qform.to_param, :qform => @qform.attributes
    assert_redirected_to qform_path(assigns(:qform))
  end

  test "should destroy qform" do
    assert_difference('Qform.count', -1) do
      delete :destroy, :id => @qform.to_param
    end

    assert_redirected_to qforms_path
  end
end
