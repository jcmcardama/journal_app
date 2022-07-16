require "test_helper"

class CreateTaskTest < ActionDispatch::IntegrationTest
    test "should create a new task" do
        @category = Category.create(name: "New Category")
        get new_category_task_path(@category.id)
        assert_response :success

        post category_tasks_path(@category.id), params: {"task": { "name": "New Task", "category_id": @category.id }}
        assert_equal Category.last.tasks.length, 1
    end

    test "should create a new task and fail" do
        @category = Category.create(name: "New Category")
        get new_category_task_path(@category.id)
        assert_response :success

        post category_tasks_path(@category.id), params: {"task": { "name": "", "category_id": @category.id }}
        assert_equal Category.last.tasks.length, 0
        assert_response :unprocessable_entity
    end

    test "should edit a new task" do
        @category = Category.create(name: "New Category")
        @task = Task.create(name: "New Task", category_id: @category.id)
        get edit_category_task_path(@category.id, @task.id)
        assert_response :success
    end

    test "should update a new task" do
        @category = Category.create(name: "New Category")
        @task = Task.create(name: "New Task", category_id: @category.id)
        patch category_task_path(@category.id, @task.id), params: {"task": { "name": "Update Task", "category_id": @category.id }}

        @task.reload

        assert_response :redirect
        assert_equal @task.name, "Update Task"
    end

    test "should update a new task and fail" do
        @category = Category.create(name: "New Category")
        @task = Task.create(name: "New Task", category_id: @category.id)
        patch category_task_path(@category.id, @task.id), params: {"task": { "name": "", "category_id": @category.id }}

        @task.reload

        assert_response :unprocessable_entity
        assert_equal @task.name, "New Task"
    end

    test "should destroy a new task" do
        @category = Category.create(name: "New Category")
        @task = Task.create(name: "New Task", category_id: @category.id)
        delete category_task_path(@category.id, @task.id)

        assert_response :redirect
        assert_equal @category.tasks.count, 0
    end
end