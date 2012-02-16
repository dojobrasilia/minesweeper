require './minesweeper'

describe MineSweeper do
  it "identifies one bomb" do
    game = MineSweeper.new("*")
    game.map.should == "*"
  end
  
  it "identifies zero bombs" do
    game = MineSweeper.new(" ")
    game.map.should == "0"
  end
  
  it "identifies two bombs" do
    game = MineSweeper.new("**")
    game.map.should == "**"
  end
  
  it "identifies two empty cells" do
    game = MineSweeper.new("  ")
    game.map.should == "00"
  end
  
  it "identifies cell with neighbor bomb on the left side" do
    game = MineSweeper.new("* ")
    game.map.should == "*1"
  end
  
  it "identifies cell with neighbor bomb on the right side" do
    game = MineSweeper.new(" *")
    game.map.should == "1*"
  end
  
  it "identifies cell with two neighbor bombs" do
    game = MineSweeper.new(" * ")
    game.map.should == "1*1"
  end
end