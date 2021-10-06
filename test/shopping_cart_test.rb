# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/shopping_cart.rb'

class ShoppingCartTest < Minitest::Test
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_no_books
    given_books([])
    price_should_be(0)
  end

  def test_one_book
    given_books([1])
    price_should_be(8)
  end

  def test_two_books_discount
    given_books([0, 1])
    price_should_be(8 * 2 * 0.95)
  end

  def test_three_books_discount
    given_books([0, 2, 4])
    price_should_be(8 * 3 * 0.9)
  end

  def test_four_books_discount
    given_books([0, 1, 2, 4])
    price_should_be(8 * 4 * 0.8)
  end

  def test_five_books_discount
    given_books([0, 1, 2, 3, 4])
    price_should_be(8 * 5 * 0.75)
  end

  def test_books_set_one_and_two
    given_books([0, 0, 1])
    price_should_be(8 + (8 * 2 * 0.95))
  end

  def test_books_set_two_two
    given_books([0, 0, 1, 1])
    price_should_be(2 * (8 * 2 * 0.95))
  end

  def test_books_set_two_four
    given_books([0, 0, 1, 2, 2, 3])
    price_should_be((8 * 2 * 0.95) + (8 * 4 * 0.8))
  end

  def test_books_set_one_five
    given_books([0, 1, 1, 2, 3, 4])
    price_should_be(8 + (8 * 5 * 0.75))
  end

  def test_edge_case_simple
    given_books([0, 0, 1, 1, 2, 2, 3, 4])
    price_should_be(2 * (8 * 4 * 0.8))
  end

  private

  def given_books(books)
    @shopping_cart = ShoppingCart.new(books)
  end

  def price_should_be(expected)
    assert_equal expected, @shopping_cart.price
  end
end
