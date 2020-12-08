require "spec_helper"
require "day_07"

include Day07

describe "Day07" do
  context "part 1" do
    it "solves sample input" do
      expect(BagFinder.new(bags: sample_input).count_bags_including("shiny gold")).to eq(4)
    end

    it "solves puzzle input" do
    end
  end

  context "part 2" do
    it "solves sample input" do
    end

    it "solves puzzle input" do
    end
  end

  private

  def sample_input
    <<~INPUT
      light red bags contain 1 bright white bag, 2 muted yellow bags.
      dark orange bags contain 3 bright white bags, 4 muted yellow bags.
      bright white bags contain 1 shiny gold bag.
      muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
      shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
      dark olive bags contain 3 faded blue bags, 4 dotted black bags.
      vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
      faded blue bags contain no other bags.
      dotted black bags contain no other bags.
    INPUT
      .split("\n")
  end

  def puzzle_input
    File.readlines("lib/day_07_input.txt", chomp: true)
  end
end
