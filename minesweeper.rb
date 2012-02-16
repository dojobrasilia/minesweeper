class MineSweeper
  attr_reader :map
  
  def initialize(mapOfBombs)
    @mapOfBombs = mapOfBombs
  end
  
  def map
    map = ""
    
    @mapOfBombs.split("").each_with_index do |char, i|
      if char == "*"
        map += char
      else
        if @mapOfBombs[i - 1] == "*"
          map += "1"
        else
          map += "0"
        end
      end
    end
    
    map
  end
  
end