require "spec_helper"
require "day_03"

include Day03

describe "Day03" do
  context "part 1" do
    it "solves sample input" do
      expect(PuzzleTraverser.new(map: sample_map).count_encountered_trees).to eq(7)
    end

    it "solves puzzle input" do
      expect(PuzzleTraverser.new(map: puzzle_map).count_encountered_trees).to eq(207)
    end
  end

  context "part 2" do
    it "solves sample input" do
      expect(part_two_puzzles(map: sample_map).map(&:count_encountered_trees).inject(&:*)).to eq(336)
    end

    it "solves puzzle input" do
      expect(part_two_puzzles(map: puzzle_map).map(&:count_encountered_trees).inject(&:*)).to eq(2655892800)
    end
  end

  private

  def sample_map
    input = <<~PUZZLE
      ..##.......
      #...#...#..
      .#....#..#.
      ..#.#...#.#
      .#...##..#.
      ..#.##.....
      .#.#.#....#
      .#........#
      #.##...#...
      #...##....#
      .#..#...#.#
    PUZZLE
    input.split("\n")
  end

  def puzzle_map
    File.readlines("lib/day_03_input.txt", chomp: true)
  end

  def part_two_puzzles(map:)
    [
      PuzzleTraverser.new(map: map, x_step: 1, y_step: 1),
      PuzzleTraverser.new(map: map, x_step: 3, y_step: 1),
      PuzzleTraverser.new(map: map, x_step: 5, y_step: 1),
      PuzzleTraverser.new(map: map, x_step: 7, y_step: 1),
      PuzzleTraverser.new(map: map, x_step: 1, y_step: 2)
    ]
  end
end
