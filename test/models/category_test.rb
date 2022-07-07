require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def test_creating
    # Category Create
    @category = Category.new

    assert_equal @category.save, true
  end
end
