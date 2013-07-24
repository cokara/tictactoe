class Cell

  attr_accessor :value

  def initialize
    @value = nil
  end

end

class Tictactoe

  attr_accessor :grid

  WINNING_COMBINATIONS = [[0,1,2],
                          [0,4,8],
                          [0,3,6],
                          [1,4,7],
                          [2,4,6],
                          [2,5,8],
                          [3,4,5],
                          [6,7,8]]

  def initialize
    ar = []
    9.times do
      ar << Cell.new
    end
    @grid = ar
  end

  def play(index, value)
    if grid[index].value.nil? && playable?
      grid[index].value = value
      true
    else
      false
    end
  end

  def winner
    return @winner if @winner
    WINNING_COMBINATIONS.detect do |(i,j,k)|
      if grid[i].value == grid[j].value && grid[j].value == grid[k].value
        @winner = grid[i].value
      end
    end
    @winner
  end

  def is_won?
    !winner.nil?
  end

  def playable?
    if is_won? || grid.detect{|c| c.value.nil? }.nil?
      false
    else
      true
    end
  end

  def empty_cell_array
    ar = []
    grid.each_with_index do |cell, i|
      ar << i if cell.value.nil?
    end
    ar
  end

  def grid_string
    grid_map = (0..8).to_a.group_by{|i| (0 + i)/3 }
    horizontal = "+-----------+\n"
    str = horizontal.dup

    row_count = 0
    square_count = 0
    grid_map.each_pair do |row, columns|
      str << "|"
      columns.each do |cell|
        str << " #{grid[cell].value || ' '} "
        str << "|"
      end
      str << "\n"
      str << horizontal
    end

    str
  end
end
