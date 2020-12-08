module Day07
  class BagFinder
    def initialize(bags:)
      @bags = bags
    end

    def count_bags_including(type)
      parsed_bags = @bags.map { |sentence|
        SentenceParser.new(sentence: sentence).parse
      }
      bgs = {}
      parsed_bags.each { |bag| bgs[bag[:color]] = bag[:contents] }
      puts bgs[type]
      # parsed_bags.find { |bag| bag.color == type }
    end
  end

  class SentenceParser
    def initialize(sentence:)
      @sentence = sentence
    end

    def parse
      match = %r{#{bag_regex} contain (?<contained_bags>.*).}.match(@sentence)
      contents = match[:contained_bags]
        .split(",")
        .filter_map { |b|
                   unless b.include?("no other")
                     %r{(?<amount>[0-9+]) #{bag_regex}}.match(b)
                   end
                 }
        .map { |match| {color: match[:color], amount: match[:amount].to_i} }
      {color: match[:color], contents: contents}
    end

    private

    def bag_regex
      @bag_regex ||= %r{(?<color>\w+ \w+) bags}
    end
  end

  Bag = Struct.new(:color, :contents, keyword_init: true)
  BagContents = Struct.new(:color, :amount, keyword_init: true)
end
