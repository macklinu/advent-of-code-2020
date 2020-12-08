require "spec_helper"
require "day_08"

include Day08

describe "Day08" do
  context "part 1" do
    it "solves sample input" do
      expect(BootCodeManager.new(boot_code: sample_input).value_before_infinite_loop).to eq(5)
    end

    it "solves puzzle input" do
      expect(BootCodeManager.new(boot_code: puzzle_input).value_before_infinite_loop).to eq(1553)
    end
  end

  context "part 2" do
    xit "solves sample input" do
    end

    xit "solves puzzle input" do
    end
  end

  private

  def sample_input
    <<~INPUT
      nop +0
      acc +1
      jmp +4
      acc +3
      jmp -3
      acc -99
      acc +1
      jmp -4
      acc +6
    INPUT
      .split("\n")
  end

  def puzzle_input
    File.readlines("lib/day_08_input.txt", chomp: true)
  end
end
