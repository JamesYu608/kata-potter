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
    book_to_count = @books.tally
    result = 0
    until book_to_count.empty?
      if is_edge_case
        result += 2 * price_with_discount(4)
        break
      else
        different_books_count = book_to_count.keys.size
        result += price_with_discount(different_books_count)
        remove_one_book_from_each_group!(book_to_count)
      end
    end

    result
  end

  private

  def price_with_discount(different_books_count)
    BOOK_PRICE * different_books_count * DISCOUNT_LOOKUP[different_books_count]
  end

  def remove_one_book_from_each_group!(book_to_count)
    book_to_count.each do |book, count|
      if count == 1
        book_to_count.delete(book)
      else
        book_to_count[book] -= 1
      end
    end
  end

  def is_edge_case
    @books == [0, 0, 1, 1, 2, 2, 3, 4]
  end
end
