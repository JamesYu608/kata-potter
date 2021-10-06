# frozen_string_literal: true

class ShoppingCart
  def initialize(books)
    @books = books
  end

  BOOK_PRICE = 8

  def price
    if @books.size == 1
      return BOOK_PRICE
    end

    0
  end
end
