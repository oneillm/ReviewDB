require 'test_helper'

class SsdmappingsControllerTest < ActionController::TestCase
  setup do
    @ssdmapping = ssdmappings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ssdmappings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ssdmapping" do
    assert_difference('Ssdmapping.count') do
      post :create, ssdmapping: { mappingid: @ssdmapping.mappingid, ssdcomment: @ssdmapping.ssdcomment, ssdcommentorid: @ssdmapping.ssdcommentorid, ssdcommentorlanguage: @ssdmapping.ssdcommentorlanguage, ssdcommentorloc: @ssdmapping.ssdcommentorloc, ssdcommentorname: @ssdmapping.ssdcommentorname, ssdcommentorrating: @ssdmapping.ssdcommentorrating, ssdcommentortimezone: @ssdmapping.ssdcommentortimezone, ssdoverallrating: @ssdmapping.ssdoverallrating, ssdpostat: @ssdmapping.ssdpostat, ssdpostingtimezone: @ssdmapping.ssdpostingtimezone, ssdtotalreview: @ssdmapping.ssdtotalreview, ssid: @ssdmapping.ssid }
    end

    assert_redirected_to ssdmapping_path(assigns(:ssdmapping))
  end

  test "should show ssdmapping" do
    get :show, id: @ssdmapping
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ssdmapping
    assert_response :success
  end

  test "should update ssdmapping" do
    patch :update, id: @ssdmapping, ssdmapping: { mappingid: @ssdmapping.mappingid, ssdcomment: @ssdmapping.ssdcomment, ssdcommentorid: @ssdmapping.ssdcommentorid, ssdcommentorlanguage: @ssdmapping.ssdcommentorlanguage, ssdcommentorloc: @ssdmapping.ssdcommentorloc, ssdcommentorname: @ssdmapping.ssdcommentorname, ssdcommentorrating: @ssdmapping.ssdcommentorrating, ssdcommentortimezone: @ssdmapping.ssdcommentortimezone, ssdoverallrating: @ssdmapping.ssdoverallrating, ssdpostat: @ssdmapping.ssdpostat, ssdpostingtimezone: @ssdmapping.ssdpostingtimezone, ssdtotalreview: @ssdmapping.ssdtotalreview, ssid: @ssdmapping.ssid }
    assert_redirected_to ssdmapping_path(assigns(:ssdmapping))
  end

  test "should destroy ssdmapping" do
    assert_difference('Ssdmapping.count', -1) do
      delete :destroy, id: @ssdmapping
    end

    assert_redirected_to ssdmappings_path
  end
end
