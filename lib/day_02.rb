module Day02
  class PasswordFinder
    def self.with_policy(policy:)
      new(policy: policy)
    end

    def initialize(policy:)
      @policy = policy
    end

    def find_valid_passwords(line_items:)
      line_items
        .map { |line_item| @policy.from_line_item(line_item) }
        .filter(&:valid?)
    end
  end

  LINE_ITEM_REGEX = %r{(\d+)-(\d+)\s([a-z]):\s(\w+)}x

  class InvalidLineItemError < StandardError; end

  CountPasswordPolicy = Struct.new(:min, :max, :letter, :password, keyword_init: true) {
    def self.from_line_item(line_item)
      match = LINE_ITEM_REGEX.match(line_item)
      raise InvalidLineItemError, "Unable to parse line item" if match.nil?
      new(
        min: match[1].to_i,
        max: match[2].to_i,
        letter: match[3],
        password: match[4]
      )
    end

    def valid?
      password.count(letter).between?(min, max)
    end
  }

  PositionPasswordPolicy = Struct.new(:start_position, :end_position, :letter, :password, keyword_init: true) {
    def self.from_line_item(line_item)
      match = LINE_ITEM_REGEX.match(line_item)
      raise InvalidLineItemError, "Unable to parse line item" if match.nil?
      new(
        start_position: match[1].to_i - 1,
        end_position: match[2].to_i - 1,
        letter: match[3],
        password: match[4]
      )
    end

    def valid?
      [password[start_position], password[end_position]].count(letter) == 1
    end
  }
end
