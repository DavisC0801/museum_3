require "minitest/autorun"
require "./lib/patron"

class PatronTest < Minitest::Test

  def setup
    @bob = Patron.new("Bob", 20)
  end

  def test_it_exists
    assert_instance_of Patron, @bob
  end

  def test_it_has_a_name
    assert_equal @bob.name, "Bob"
  end

  def test_it_has_spending_money
    assert_equal @bob.spending_money, 20
  end

  def test_it_has_no_interests_by_default
    assert_equal @bob.interests, []
  end

  def test_interests_can_be_added
    @bob.add_interest("Dead Sea Scrolls")
    @bob.add_interest("Gems and Minerals")
    assert_equal @bob.interests, ["Dead Sea Scrolls", "Gems and Minerals"]
  end

end
