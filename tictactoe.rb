require 'pry'
class Cell

  attr_accessor :value

  def initialize
    @value = nil
  end

end


class Tictactoe

  attr_accessor :grid

  def initialize
    ar = []
    9.times do
      ar << Cell.new
    end
    @grid = ar
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
