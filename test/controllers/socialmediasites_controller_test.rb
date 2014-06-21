require 'test_helper'

class SocialmediasitesControllerTest < ActionController::TestCase
  setup do
    @socialmediasite = socialmediasites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:socialmediasites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create socialmediasite" do
    assert_difference('Socialmediasite.count') do
      post :create, socialmediasite: { ssaccesstoken: @socialmediasite.ssaccesstoken, ssaccesstokensecretkey: @socialmediasite.ssaccesstokensecretkey, ssconsumerkey: @socialmediasite.ssconsumerkey, ssconsumersecret: @socialmediasite.ssconsumersecret, ssid: @socialmediasite.ssid, ssname: @socialmediasite.ssname, ssurl: @socialmediasite.ssurl, ssurlquery: @socialmediasite.ssurlquery, status: @socialmediasite.status, userid: @socialmediasite.userid }
    end

    assert_redirected_to socialmediasite_path(assigns(:socialmediasite))
  end

  test "should show socialmediasite" do
    get :show, id: @socialmediasite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @socialmediasite
    assert_response :success
  end

  test "should update socialmediasite" do
    patch :update, id: @socialmediasite, socialmediasite: { ssaccesstoken: @socialmediasite.ssaccesstoken, ssaccesstokensecretkey: @socialmediasite.ssaccesstokensecretkey, ssconsumerkey: @socialmediasite.ssconsumerkey, ssconsumersecret: @socialmediasite.ssconsumersecret, ssid: @socialmediasite.ssid, ssname: @socialmediasite.ssname, ssurl: @socialmediasite.ssurl, ssurlquery: @socialmediasite.ssurlquery, status: @socialmediasite.status, userid: @socialmediasite.userid }
    assert_redirected_to socialmediasite_path(assigns(:socialmediasite))
  end

  test "should destroy socialmediasite" do
    assert_difference('Socialmediasite.count', -1) do
      delete :destroy, id: @socialmediasite
    end

    assert_redirected_to socialmediasites_path
  end
end
