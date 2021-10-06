# frozen_string_literal: true

class ShoppingCart
  def initialize(books)
    @books = books
  end

  BOOK_PRICE = 8
  DISCOUNT_LOOKUP =
    {
      1 => 1,
      2 => 0.95,
      3 => 0.9,
      4 => 0.8,
      5 => 0.75
    }.freeze

  def price
    if @books.size.positive?
      return BOOK_PRICE * @books.size * DISCOUNT_LOOKUP[@books.size]
    end

    0
  end
end
