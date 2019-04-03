require "minitest"
require "./lib/exhibit"

class ExhibitTest < Minitest::Test

  def setup
    @exhibit = Exhibit.new("Gems and Minerals", 0)
  end

  def test_it_exists
    assert_isntance_of Exhibit, @exhibit
  end

  def test_it_has_a_name
    assert_equal @exhibit.name, "Gems and Minerals"
  end

  def test_it_has_a_cost
    assert_equal @exhibit.cost, 0
  end

end
