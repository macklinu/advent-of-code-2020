module Day01
  class SumFinder
    def initialize(sum:)
      @sum = sum
    end

    def product_of_sum_entries(entries:, num_entries:)
      sum_entries = entries.permutation(num_entries).find { |values| values.sum == @sum }
      product(sum_entries)
    end

    private

    def product(array)
      array.inject(&:*)
    end
  end
end
