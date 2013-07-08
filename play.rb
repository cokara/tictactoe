require "./tictactoe"


def results(game)
  puts ''
  puts "*****RESULTS****"
  if game.is_won?
    puts "the #{game.winner}'s win!!!!!!!"
  else
    puts "Stalemate"
  end
  print game.grid_string

  puts ''
end

def play_game(game, turn, value)
  prompt = "Choose an empty box to fill (1 thru 9): "
  value = value.upcase
  comp_val = value.upcase == 'X' ? 'O' : 'X'
  if turn == 's'
    index = (0..8).to_a.sample
    game.play(index, comp_val)
  end
  puts game.grid_string
  while game.playable?
    valid = false
    while !valid
      print prompt
      index = gets.chomp.to_i - 1
      valid = game.play(index, value)
    end
    break unless game.playable?
    index = game.empty_cell_array.sample
    game.play(index, comp_val)
    puts game.grid_string
  end
  results(game)
end


def new_game
  print "X or O? :"
  value = gets.chomp
  print "First or second (f/s):"
  turn =  gets.chomp
  [Tictactoe.new, turn, value]
end

play_game(*new_game)

puts 'bye'
