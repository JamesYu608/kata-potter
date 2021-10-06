# frozen_string_literal: true

class ShoppingCart
  def initialize(books)
    @books = books
  end

  BOOK_PRICE = 8

  def price
    if @books.size == 2
      return BOOK_PRICE * @books.size * 0.95
    end
    if @books.size == 1
      return BOOK_PRICE
    end

    0
  end
end
