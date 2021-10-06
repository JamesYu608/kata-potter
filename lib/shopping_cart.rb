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
    series_to_count = @books.tally
    unless series_to_count.empty?
      result = 0
      until series_to_count.empty?
        series_count = series_to_count.keys.size
        result += BOOK_PRICE * series_count * DISCOUNT_LOOKUP[series_count]
        series_to_count.each do |series, count|
          if count == 1
            series_to_count.delete(series)
          else
            series_to_count[series] -= 1
          end
        end
      end
      return result
    end

    0
  end
end
