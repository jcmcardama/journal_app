require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
    
    include Devise::Test::IntegrationHelpers
    
    setup do
        sign_in users(:user1)
    end

    test "should get index" do
        get categories_path
        assert_response :success
    end

    test "should show category" do
        get categories_path(1)
        assert_response :success
    end

    test "should create new category" do
        post categories_path, params: {"category": { "name": "Personal" }}
        assert_response :redirect
    end

    test "should create new category and fail" do
        assert_difference 'Category.count', 0 do
            post categories_path, params: {"category": { "name": "" }}
            assert_response :unprocessable_entity
        end
    end

    test "should edit category" do
        @category = Category.create(name: "Personal")
        get edit_category_path(@category.id)
        assert_response :success
    end

    test "should update category" do
        @category = Category.create(name: "Personal")
        patch category_path(@category.id), params: {"category": { "name": "Update" }}
        assert_response :redirect
        @category.reload
        assert_equal @category.name, "Update"
    end

    test "should update category and fail" do
        @category = Category.create(name: "Personal")
        patch category_path(@category.id), params: {"category": { "name": "" }}
        assert_response :unprocessable_entity
    end

    test "should destroy category" do
        @category = Category.create(name: "Personal")
        delete category_path(@category.id)
        assert_response :redirect
    end
end