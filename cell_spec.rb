require 'rspec'
require './tictactoe'

describe Cell do
  it 'should have a value' do
    c = Cell.new
    c.respond_to?(:value).should be(true)
  end

  it 'should have the value set' do
    c = Cell.new
    c.value = 'X'
    c.value.should == 'X'
  end
end

describe Tictactoe do
  it 'should have a grid with nine cells' do
    t = Tictactoe.new
    t.grid.count.should == 9
    t.grid.last.should be_an_instance_of(Cell)
  end

  context "A new game" do
    it 'should build grid string correctly' do
      t = Tictactoe.new
      t.grid_string.should == "+-----------+\n" +
                              "|   |   |   |\n" +
                              "+-----------+\n" +
                              "|   |   |   |\n" +
                              "+-----------+\n" +
                              "|   |   |   |\n" +
                              "+-----------+\n"

    end
  end

  context "A game in progress" do
    let(:game) do
      t = Tictactoe.new
      t.grid[0].value = 'X'
      t.grid[4].value = 'O'
      t.grid[8].value = 'X'
      t
    end

    it 'should build grid string correctly' do
      game.grid_string.should == "+-----------+\n" +
                                 "| X |   |   |\n" +
                                 "+-----------+\n" +
                                 "|   | O |   |\n" +
                                 "+-----------+\n" +
                                 "|   |   | X |\n" +
                                 "+-----------+\n"

    end

    it "should let an empty cell be filled" do
      game.play(1,'O').should == true
      game.grid[1].value.should == 'O'
    end

    it "should not let a filled in cell be overwritten" do
      game.play(1,'O').should == true
      game.grid[1].value.should == 'O'
      game.play(1,'X').should == false
      game.grid[1].value.should == 'O'
    end

    it "knows when a game is won" do
      game.is_won?.should == false
    end

    it "should be playable" do
      game.playable?.should == true
    end

    it "should know all empty cells" do
      game.empty_cell_array.should == [1,2,3,5,6,7]
    end
  end

  context "Winning" do
    let(:game) do
      t = Tictactoe.new
      t.grid[0].value = 'X'
      t.grid[1].value = 'O'
      t.grid[2].value = 'O'
      t.grid[4].value = 'X'
      t.grid[8].value = 'X'
      t
    end
    it "know when a game is won" do
      game.is_won?.should == true
    end

    it "should not be playable" do
      game.playable?.should == false
      game.play(7,'O').should == false
      game.grid[7].value.should == nil
    end

    it "should know which value won" do
      game.winner.should == "X"
    end
  end

  context "Stalemate" do
    let(:game) do
      t = Tictactoe.new
      t.grid[0].value = 'X'
      t.grid[1].value = 'O'
      t.grid[2].value = 'O'
      t.grid[3].value = 'O'
      t.grid[4].value = 'O'
      t.grid[5].value = 'X'
      t.grid[6].value = 'X'
      t.grid[7].value = 'X'
      t.grid[8].value = 'O'
      t
    end
    it "knows when a game is at a stalemate" do
      game.is_won?.should == false
    end

    it "should not be playable" do
      game.playable?.should == false
    end

    it "should not have a winner" do
      game.winner.should == nil
    end
  end
end
