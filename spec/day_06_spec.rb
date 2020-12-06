require "spec_helper"
require "day_06"

include Day06

describe "Day06" do
  context "part 1" do
    it "solves sample input" do
      expect(total_answers(input: sample_input)).to eq(11)
    end

    it "solves puzzle input" do
      expect(total_answers(input: puzzle_input)).to eq(6768)
    end
  end

  context "part 2" do
    it "solves sample input" do
      expect(total_groups_where_all_answered_yes(input: sample_input)).to eq(6)
    end

    it "solves puzzle input" do
      expect(total_groups_where_all_answered_yes(input: puzzle_input)).to eq(3489)
    end
  end

  private

  def total_answers(input:)
    input
      .map { |answers| AnswerAnalyzer.new(answers: answers) }
      .map(&:total_answers)
      .sum
  end

  def total_groups_where_all_answered_yes(input:)
    input
      .map { |answers| AnswerAnalyzer.new(answers: answers) }
      .map(&:total_groups_where_all_answered_yes)
      .sum
  end

  def sample_input
    <<~INPUT
      abc

      a
      b
      c

      ab
      ac

      a
      a
      a
      a

      b
    INPUT
      .split(/\n\n/)
  end

  def puzzle_input
    File.read("lib/day_06_input.txt", chomp: true).split(/\n\n/)
  end
end
