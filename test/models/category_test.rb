require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  include Devise::Test::IntegrationHelpers
    
  setup do
      @user = users(:one)
      @category = categories(:one)

      sign_in(@user)
  end

  def test_creating
    # Category Create
    @category = @user.categories.build(name: "Personal")

    assert_equal @category.save, true
  end

  def test_task_association
    @category = @user.categories.create(name: "Personal")
    assert_difference "Category.last.tasks.length", 1 do
      @task = Task.create(name: "New task", category_id: @category.id)
    end
  end
end
