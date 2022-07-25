require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

    include Devise::Test::IntegrationHelpers
    
    setup do
        @user = users(:one)
        @category = categories(:one)

        sign_in(@user)
    end

    test "should get index" do
        get categories_path
        assert_response :success
    end

    test "should show category" do
        get categories_path(1)
        assert_response :success
    end

    # test "should not show category" do
    #     get new_category_path 
    #     assert_response :success

    #     post categories_path, params: {"category": { "name": "Personal" }}
    #     assert_response :redirect

    #     @user2 = users(:two)

    #     sign_in(@user2)

    #     get categories_path(Category.last.id)
    #     assert_response :redirect
    # end

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
        @category = @user.categories.create(name: "Personal")
        get edit_category_path(@category.id)
        assert_response :success
    end

    test "should update category" do
        @category = @user.categories.create(name: "Personal")
        patch category_path(@category.id), params: {"category": { "name": "Update" }}
        assert_response :redirect
        @category.reload
        assert_equal @category.name, "Update"
    end

    test "should update category and fail" do
        @category = @user.categories.create(name: "Personal")
        patch category_path(@category.id), params: {"category": { "name": "" }}
        assert_response :unprocessable_entity
    end

    test "should destroy category" do
        @category = @user.categories.create(name: "Personal")
        delete category_path(@category.id)
        assert_response :redirect
    end
end