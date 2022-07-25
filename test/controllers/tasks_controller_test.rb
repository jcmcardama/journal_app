require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  include Devise::Test::IntegrationHelpers
    
  setup do
    @user = users(:one)
    @category = categories(:one)

    sign_in(@user)
  end

  test "should show task" do
    @category = @user.categories.create(name: "Personal")
    @task = Task.create(category_id: @category.id, name: "Personal")

    get category_task_path(@category.id, @task.id)
    assert_response :success
  end

  test "should load home" do
    get home_path
    assert_response :success
  end

  test "should load urgent tasks" do
    get urgent_path
    assert_response :success
  end

  test "should load overdue tasks" do
    get overdue_path
    assert_response :success
  end

  test "should create new task" do
    @category = @user.categories.create(name: "Personal")

    post category_tasks_path(@category.id), params: {"task": { "name": "Personal Task" , "category_id": "1"}}
    assert_response :redirect
  end
end
