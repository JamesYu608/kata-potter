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
    books_group = @books.tally
    unless books_group.empty?
      different_books_count = books_group.keys.size
      return BOOK_PRICE * different_books_count * DISCOUNT_LOOKUP[different_books_count]
    end

    0
  end
end
