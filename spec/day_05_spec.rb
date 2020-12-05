require "spec_helper"
require "day_05"

include Day05

describe "Day05" do
  context "part 1" do
    it "solves sample input" do
      expect(BoardingPassScanner.new(pass: "FBFBBFFRLR").scan).to eq(SeatInfo.new(row: 44, column: 5, seat_id: 357))
      expect(BoardingPassScanner.new(pass: "BFFFBBFRRR").scan).to eq(SeatInfo.new(row: 70, column: 7, seat_id: 567))
      expect(BoardingPassScanner.new(pass: "FFFBBBFRRR").scan).to eq(SeatInfo.new(row: 14, column: 7, seat_id: 119))
      expect(BoardingPassScanner.new(pass: "BBFFBBFRLL").scan).to eq(SeatInfo.new(row: 102, column: 4, seat_id: 820))
    end

    it "solves puzzle input" do
      expect(
        puzzle_input
          .map { |pass| BoardingPassScanner.new(pass: pass).scan }
          .map(&:seat_id)
          .max
      ).to eq(980)
    end
  end

  context "part 2" do
    it "solves puzzle input" do
      seat_ids = puzzle_input
        .map { |pass| BoardingPassScanner.new(pass: pass).scan }
        .map(&:seat_id)
        .to_set
      my_seat_id = (seat_ids.min...seat_ids.max).find { |n| !seat_ids.include?(n + 1) } + 1

      expect(my_seat_id).to eq(607)
    end
  end

  private

  def puzzle_input
    File.readlines("lib/day_05_input.txt", chomp: true)
  end
end
