module Day03
  class PuzzleTraverser
    TREE = "#"

    def initialize(map:, x_step: 3, y_step: 1)
      @map = map
      @width = map[0].length
      @height = map.length
      @x_step = x_step
      @y_step = y_step
    end

    def count_encountered_trees
      trees = 0
      y = 0
      x = 0
      loop do
        trees += 1 if @map[y][x] == TREE
        x = (x + @x_step) % @width
        y += @y_step
        break if y >= @height
      end
      trees
    end
  end
end
