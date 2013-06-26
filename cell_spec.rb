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
