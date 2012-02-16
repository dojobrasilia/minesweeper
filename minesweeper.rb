class MineSweeper
  attr_reader :map
  
  def initialize(mapOfBombs)
    @mapOfBombs = mapOfBombs
    @openMap = ""
  end
  
  def map
    @mapOfBombs.split("").each_with_index do |cell, i|
      if bomb? cell
        @openMap[i] = "*"
      else
        if(i > 0)
          show_if_cell_has_bomb(@mapOfBombs[i - 1], i)
        elsif(i < @mapOfBombs.size)
          show_if_cell_has_bomb(@mapOfBombs[i + 1], i)
        end
      end
    end
    
    @openMap
  end
  
  def show_if_cell_has_bomb(cell, i)
    if bomb? cell
      @openMap[i] = "1"
    else
      @openMap[i] = "0"
    end
  end
  
  def bomb?(cell)
    cell == "*"
  end
  
end