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
    shopping_cart = ShoppingCart.new([])
    assert_equal 0, shopping_cart.price
  end
end
