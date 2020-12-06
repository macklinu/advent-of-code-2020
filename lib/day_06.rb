module Day06
  class AnswerAnalyzer
    def initialize(answers:)
      @answers = answers
    end

    def total_answers
      @answers.delete("\n")
        .chars
        .to_set
        .count
    end

    def total_groups_where_all_answered_yes
      @answers.split("\n")
        .map(&:chars)
        .inject(:&)
        .count
    end
  end
end
