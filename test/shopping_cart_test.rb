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

  private

  def given_books(books)
    @shopping_cart = ShoppingCart.new(books)
  end

  def price_should_be(expected)
    assert_equal expected, @shopping_cart.price
  end
end
