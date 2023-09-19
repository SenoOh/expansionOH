require "test_helper"

class PeopleitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @peopleitem = peopleitems(:one)
  end

  test "should get index" do
    get peopleitems_url
    assert_response :success
  end

  test "should get new" do
    get new_peopleitem_url
    assert_response :success
  end

  test "should create peopleitem" do
    assert_difference("Peopleitem.count") do
      post peopleitems_url, params: { peopleitem: { label: @peopleitem.label, name: @peopleitem.name, people_id: @peopleitem.people_id, plate: @peopleitem.plate } }
    end

    assert_redirected_to peopleitem_url(Peopleitem.last)
  end

  test "should show peopleitem" do
    get peopleitem_url(@peopleitem)
    assert_response :success
  end

  test "should get edit" do
    get edit_peopleitem_url(@peopleitem)
    assert_response :success
  end

  test "should update peopleitem" do
    patch peopleitem_url(@peopleitem), params: { peopleitem: { label: @peopleitem.label, name: @peopleitem.name, people_id: @peopleitem.people_id, plate: @peopleitem.plate } }
    assert_redirected_to peopleitem_url(@peopleitem)
  end

  test "should destroy peopleitem" do
    assert_difference("Peopleitem.count", -1) do
      delete peopleitem_url(@peopleitem)
    end

    assert_redirected_to peopleitems_url
  end
end
