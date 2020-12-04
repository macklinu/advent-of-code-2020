require "spec_helper"
require "day_04"

include Day04

describe "Day04" do
  context "part 1" do
    it "solves sample input" do
      expect(LoosePassportValidator.new(
        passport: <<~PASSPORT
          ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
          byr:1937 iyr:2017 cid:147 hgt:183cm
        PASSPORT
      )).to be_valid

      expect(LoosePassportValidator.new(
        passport: <<~PASSPORT
          iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
          hcl:#cfa07d byr:1929
        PASSPORT
      )).not_to be_valid

      expect(LoosePassportValidator.new(
        passport: <<~PASSPORT
          hcl:#ae17e1 iyr:2013
          eyr:2024
          ecl:brn pid:760753108 byr:1931
          hgt:179cm
        PASSPORT
      )).to be_valid

      expect(LoosePassportValidator.new(
        passport: <<~PASSPORT
          hcl:#cfa07d eyr:2025 pid:166559648
          iyr:2011 ecl:brn hgt:59in
        PASSPORT
      )).not_to be_valid
    end

    it "solves puzzle input" do
      valid_passwords = puzzle_input
        .map { |passport| LoosePassportValidator.new(passport: passport) }
        .count(&:valid?)

      expect(valid_passwords).to eq(216)
    end
  end

  context "part 2" do
    it "solves sample input" do
      valid_passports = part_two_valid_passports.map { |passport| StrictPassportValidator.new(passport: passport) }
      invalid_passports = part_two_invalid_passports.map { |passport| StrictPassportValidator.new(passport: passport) }

      expect(valid_passports.all?(&:valid?)).to eq(true)
      expect(invalid_passports.all?(&:valid?)).to eq(false)
    end

    it "solves puzzle input" do
      valid_passports = puzzle_input
        .map { |passport| StrictPassportValidator.new(passport: passport) }
        .count(&:valid?)

      expect(valid_passports).to eq(150)
    end
  end

  context BirthYearValidator do
    it "validates birth years" do
      expect(BirthYearValidator.new("2002")).to be_valid
      expect(BirthYearValidator.new("2003")).not_to be_valid
    end
  end

  context HeightValidator do
    it "validates heights" do
      expect(HeightValidator.new("60in")).to be_valid
      expect(HeightValidator.new("190cm")).to be_valid
      expect(HeightValidator.new("190in")).not_to be_valid
      expect(HeightValidator.new("190")).not_to be_valid
    end
  end

  context HairColorValidator do
    it "validates hair colors" do
      expect(HairColorValidator.new("#123abc")).to be_valid
      expect(HairColorValidator.new("#123abz")).not_to be_valid
      expect(HairColorValidator.new("123abc")).not_to be_valid
    end
  end

  context EyeColorValidator do
    it "validates eye colors" do
      expect(EyeColorValidator.new("brn")).to be_valid
      expect(EyeColorValidator.new("wat")).not_to be_valid
    end
  end

  context PassportIDValidator do
    it "validates passport ids" do
      expect(PassportIDValidator.new("000000001")).to be_valid
      expect(PassportIDValidator.new("0123456789")).not_to be_valid
    end
  end

  private

  def puzzle_input
    File.read("lib/day_04_input.txt").split(/\n\n/)
  end

  def part_two_valid_passports
    <<~PASSPORT
      pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
      hcl:#623a2f

      eyr:2029 ecl:blu cid:129 byr:1989
      iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm

      hcl:#888785
      hgt:164cm byr:2001 iyr:2015 cid:88
      pid:545766238 ecl:hzl
      eyr:2022

      iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719
    PASSPORT
      .split(/\n\n/)
  end

  def part_two_invalid_passports
    <<~PASSPORT
      eyr:1972 cid:100
      hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926

      iyr:2019
      hcl:#602927 eyr:1967 hgt:170cm
      ecl:grn pid:012533040 byr:1946

      hcl:dab227 iyr:2012
      ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277

      hgt:59cm ecl:zzz
      eyr:2038 hcl:74454a iyr:2023
      pid:3556412378 byr:2007
    PASSPORT
      .split(/\n\n/)
  end
end
