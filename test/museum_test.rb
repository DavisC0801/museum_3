require "minitest/autorun"
require "./lib/patron"
require "./lib/exhibit"
require "./lib/museum"

class MuseumTest < Minitest::Test

  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    @dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    @imax = Exhibit.new("IMAX", 15)
    @bob = Patron.new("Bob", 20)
    @bob.add_interest("Dead Sea Scrolls")
    @bob.add_interest("Gems and Minerals")
    @sally = Patron.new("Sally", 20)
  end

  def test_it_exists
    assert_instance_of Museum, @dmns
  end

  def test_it_has_a_name
    assert_equal @dmns.name, "Denver Museum of Nature and Science"
  end

  def test_it_starts_with_no_exhibits
    assert_equal @dmns.exhibits, []
  end

  def test_exhibits_can_be_added
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    assert_equal @dmns.exhibits, [@gems_and_minerals, @dead_sea_scrolls, @imax]
  end

  def test_it_recommends_exhibits
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    @sally.add_interest("IMAX")
    assert_equal @dmns.recommend_exhibits(@bob), [@gems_and_minerals, @dead_sea_scrolls]
    assert_equal @dmns.recommend_exhibits(@sally), [@imax]
  end

  def test_it_starts_with_no_patrons
    assert_equal @dmns.patrons, []
  end

  def test_it_can_admit_patrons
    @dmns.admit(@bob)
    @dmns.admit(@sally)
    assert_equal @dmns.patrons, [@bob, @sally]
  end

  def test_it_can_list_patrons_by_exhibit_interest
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    @dmns.admit(@bob)
    @dmns.admit(@sally)
    @sally.add_interest("Dead Sea Scrolls")

    expected = {
      @gems_and_minerals => [@bob],
      @dead_sea_scrolls => [@bob, @sally],
      @imax => []
    }

    assert_equal @dmns.patrons_by_exhibit_interest, expected
  end
end
