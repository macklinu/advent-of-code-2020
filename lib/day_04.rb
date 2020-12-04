module Day04
  class LoosePassportValidator
    def initialize(passport:)
      @passport = passport
    end

    def valid?
      passport_field_keys = FieldParser.new(passport: @passport).keys.to_set
      (required_field_keys - passport_field_keys).empty?
    end

    private

    def required_field_keys
      Set.new([:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid])
    end
  end

  class StrictPassportValidator
    def initialize(passport:)
      @parser = FieldParser.new(passport: passport)
    end

    def valid?
      [
        BirthYearValidator.new(@parser[:byr]),
        IssueYearValidator.new(@parser[:iyr]),
        ExpirationYearValidator.new(@parser[:eyr]),
        HeightValidator.new(@parser[:hgt]),
        HairColorValidator.new(@parser[:hcl]),
        EyeColorValidator.new(@parser[:ecl]),
        PassportIDValidator.new(@parser[:pid])
      ].all?(&:valid?)
    end
  end

  BirthYearValidator = Struct.new(:birth_year) {
    def valid?
      birth_year&.to_i&.between?(1920, 2002)
    end
  }

  IssueYearValidator = Struct.new(:issue_year) {
    def valid?
      issue_year&.to_i&.between?(2010, 2020)
    end
  }

  ExpirationYearValidator = Struct.new(:expiration_year) {
    def valid?
      expiration_year&.to_i&.between?(2020, 2030)
    end
  }

  HeightValidator = Struct.new(:height) {
    def valid?
      match = height&.match(/^(?<value>\d+)(?<unit>in|cm)$/)
      return false if match.nil?
      case match[:unit]
      when "cm"
        match[:value].to_i.between?(150, 193)
      when "in"
        match[:value].to_i.between?(59, 76)
      else
        false
      end
    end
  }

  HairColorValidator = Struct.new(:hair_color) {
    def valid?
      hair_color&.match?(/^#[a-f0-9]{6}$/)
    end
  }

  EyeColorValidator = Struct.new(:eye_color) {
    def valid?
      valid_eye_colors.include?(eye_color)
    end

    private

    def valid_eye_colors
      ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
    end
  }

  PassportIDValidator = Struct.new(:passport_id) {
    def valid?
      passport_id&.match?(/^[0-9]{9}$/)
    end
  }

  class FieldParser
    def initialize(passport:)
      @passport = passport
    end

    def fields
      @fields ||= @passport.tr("\n", " ")
        .split(/\s/)
        .to_h { |item| to_key_value(item) }
    end

    def keys
      fields.keys
    end

    def [](key)
      fields[key]
    end

    private

    def to_key_value(item)
      key, value = item.split(/:/)
      [key.to_sym, value]
    end
  end
end
