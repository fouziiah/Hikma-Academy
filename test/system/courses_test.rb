require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  setup do
    @course = courses(:one)
  end

  test "visiting the index" do
    visit courses_url
    assert_selector "h1", text: "Courses"
  end

  test "should create course" do
    visit courses_url
    click_on "New course"

    fill_in "Capacity", with: @course.capacity
    fill_in "Child", with: @course.child_id
    fill_in "Description", with: @course.description
    fill_in "End date", with: @course.end_date
    fill_in "Format", with: @course.format
    fill_in "Location", with: @course.location
    fill_in "Name", with: @course.name
    fill_in "Payment type", with: @course.payment_type
    fill_in "Start date", with: @course.start_date
    fill_in "Status", with: @course.status
    fill_in "String", with: @course.string
    fill_in "Teacher", with: @course.teacher
    fill_in "Type", with: @course.type
    fill_in "User", with: @course.user_id
    click_on "Create Course"

    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "should update Course" do
    visit course_url(@course)
    click_on "Edit this course", match: :first

    fill_in "Capacity", with: @course.capacity
    fill_in "Child", with: @course.child_id
    fill_in "Description", with: @course.description
    fill_in "End date", with: @course.end_date
    fill_in "Format", with: @course.format
    fill_in "Location", with: @course.location
    fill_in "Name", with: @course.name
    fill_in "Payment type", with: @course.payment_type
    fill_in "Start date", with: @course.start_date
    fill_in "Status", with: @course.status
    fill_in "String", with: @course.string
    fill_in "Teacher", with: @course.teacher
    fill_in "Type", with: @course.type
    fill_in "User", with: @course.user_id
    click_on "Update Course"

    assert_text "Course was successfully updated"
    click_on "Back"
  end

  test "should destroy Course" do
    visit course_url(@course)
    click_on "Destroy this course", match: :first

    assert_text "Course was successfully destroyed"
  end
end
