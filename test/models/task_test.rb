require "test_helper"

class TaskTest < ActiveSupport::TestCase

  include Devise::Test::IntegrationHelpers
    
  setup do
    @user = users(:one)
    @category = categories(:one)

    sign_in(@user)
  end

  test "category association" do
    @category = @user.categories.create(name: "Personal")
    @task = Task.create(category_id: @category.id)
    assert_equal @task.category, @category
  end
end
