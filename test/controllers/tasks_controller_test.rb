require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should show task" do
    @category = Category.create(name: "Personal")
    @task = Task.create(category_id: @category.id, name: "Personal")

    get category_task_path(@category.id, @task.id)
    assert_response :success
  end

  test "should create new task" do
    @category = Category.create(name: "Personal")

    post category_tasks_path(@category.id), params: {"task": { "name": "Personal Task" , "category_id": "1"}}
    assert_response :redirect
  end
end
