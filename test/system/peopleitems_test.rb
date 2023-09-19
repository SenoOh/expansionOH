require "application_system_test_case"

class PeopleitemsTest < ApplicationSystemTestCase
  setup do
    @peopleitem = peopleitems(:one)
  end

  test "visiting the index" do
    visit peopleitems_url
    assert_selector "h1", text: "Peopleitems"
  end

  test "should create peopleitem" do
    visit peopleitems_url
    click_on "New peopleitem"

    fill_in "Label", with: @peopleitem.label
    fill_in "Name", with: @peopleitem.name
    fill_in "People", with: @peopleitem.people_id
    fill_in "Plate", with: @peopleitem.plate
    click_on "Create Peopleitem"

    assert_text "Peopleitem was successfully created"
    click_on "Back"
  end

  test "should update Peopleitem" do
    visit peopleitem_url(@peopleitem)
    click_on "Edit this peopleitem", match: :first

    fill_in "Label", with: @peopleitem.label
    fill_in "Name", with: @peopleitem.name
    fill_in "People", with: @peopleitem.people_id
    fill_in "Plate", with: @peopleitem.plate
    click_on "Update Peopleitem"

    assert_text "Peopleitem was successfully updated"
    click_on "Back"
  end

  test "should destroy Peopleitem" do
    visit peopleitem_url(@peopleitem)
    click_on "Destroy this peopleitem", match: :first

    assert_text "Peopleitem was successfully destroyed"
  end
end
