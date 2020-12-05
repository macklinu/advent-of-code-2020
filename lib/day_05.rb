module Day05
  class BoardingPassScanner
    def initialize(pass:)
      @pass = pass
    end

    def scan
      row = binary_partition(characters: row_characters, lower: "F", upper: "B")
      column = binary_partition(characters: column_characters, lower: "L", upper: "R")
      SeatInfo.new(
        row: row,
        column: column,
        seat_id: (row * 8) + column
      )
    end

    private

    def binary_partition(characters:, lower:, upper:)
      characters
        .gsub(lower, "0")
        .gsub(upper, "1")
        .to_i(2)
    end

    def row_characters
      @pass.slice(0...7)
    end

    def column_characters
      @pass.slice(7...@pass.length)
    end
  end

  SeatInfo = Struct.new(:row, :column, :seat_id, keyword_init: true)
end
