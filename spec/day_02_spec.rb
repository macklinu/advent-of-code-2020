require "spec_helper"
require "day_02"

include Day02

describe "Day02" do
  context "part 1" do
    it "finds valid passwords with sample input" do
      expect(
        total_passwords_matching_policy(policy: CountPasswordPolicy, input: sample_input)
      ).to eq(2)
    end

    it "finds valid passwords with puzzle input" do
      expect(
        total_passwords_matching_policy(policy: CountPasswordPolicy, input: puzzle_input)
      ).to eq(607)
    end
  end

  context "part 2" do
    it "finds valid passwords with sample input" do
      expect(
        total_passwords_matching_policy(policy: PositionPasswordPolicy, input: sample_input)
      ).to eq(1)
    end

    it "finds valid passwords with puzzle input" do
      expect(
        total_passwords_matching_policy(policy: PositionPasswordPolicy, input: puzzle_input)
      ).to eq(321)
    end
  end

  private

  def total_passwords_matching_policy(policy:, input:)
    PasswordFinder.with_policy(policy: policy)
      .find_valid_passwords(line_items: input)
      .length
  end

  def sample_input
    [
      "1-3 a: abcde",
      "1-3 b: cdefg",
      "2-9 c: ccccccccc"
    ]
  end

  def puzzle_input
    File.readlines("lib/day_02_input.txt", chomp: true)
  end
end
