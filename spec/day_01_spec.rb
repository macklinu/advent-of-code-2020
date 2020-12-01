require "spec_helper"
require "day_01"

describe Day01::SumFinder do
  context "part 1" do
    it "finds the product of supplied example sum entries" do
      product = Day01::SumFinder.new(sum: 2020).product_of_sum_entries(entries: sample_entries, num_entries: 2)
      expect(product).to eq(514579)
    end
    it "finds the product of sum entries for puzzle input" do
      product = Day01::SumFinder.new(sum: 2020).product_of_sum_entries(entries: puzzle_entries, num_entries: 2)
      expect(product).to eq(802011)
    end
  end
  context "part 2" do
    it "finds the product of supplied example sum entries" do
      product = Day01::SumFinder.new(sum: 2020).product_of_sum_entries(entries: sample_entries, num_entries: 3)
      expect(product).to eq(241861950)
    end
    it "finds the product of sum entries for puzzle input" do
      product = Day01::SumFinder.new(sum: 2020).product_of_sum_entries(entries: puzzle_entries, num_entries: 3)
      expect(product).to eq(248607374)
    end
  end

  private

  def sample_entries
    [
      1721,
      979,
      366,
      299,
      675,
      1456
    ]
  end

  def puzzle_entries
    File.readlines("lib/day_01_input.txt", chomp: true).map(&:to_i)
  end
end
