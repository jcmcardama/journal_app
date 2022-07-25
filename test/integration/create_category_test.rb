require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
    
    setup do
        @user = users(:one)
        @category = categories(:one)

        sign_in(@user)
    end

    test "should create a new category" do
        get new_category_path 
        assert_response :success

        assert_difference 'Category.count', 1 do
            post categories_path, params: {"category": { "name": "Personal" }}
            assert_response :redirect
        end

        follow_redirect!
        assert_response :success
    end
end