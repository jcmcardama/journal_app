require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def test_creating
    # Category Create
    @category = Category.new(name: "Personal")

    assert_equal @category.save, true
  end

  def test_task_association
    @category = Category.create(name: "Personal")
    assert_equal(@category.tasks.length, 0)
  end
end
