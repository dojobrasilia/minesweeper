class Cell
  attr_accessor :char, :position
  
  def initialize(char, position)
    @char, @position = char, position
    @char = "0" if @char == " "
  end
  
  def bomb?
    @char == "*"
  end
end

class MineSweeper
  attr_reader :map
  
  def initialize(mapOfBombs)
    @mapOfCells = parseStringMap(mapOfBombs)
  end
  
  def map
    @mapOfCells.each do |cell|
      verify_bombs_in_the_neighborhood(cell) unless cell.char == '*'
    end
    
    @mapOfCells.map { |cell| cell.char }.join
  end
  
  def parseStringMap(mapOfBombs)
    openMap = []
    mapOfBombs.split("").each_with_index do |char, position|
      openMap << Cell.new(char, position)
    end
    openMap
  end
  
  def verify_bombs_in_the_neighborhood cell
    if @mapOfCells.size > 1
      if(cell.position > 0)
        show_if_cell_has_bomb(@mapOfCells[cell.position - 1], cell)
      elsif(cell.position < @mapOfCells.size)
        show_if_cell_has_bomb(@mapOfCells[cell.position + 1], cell)
      end
    end
  end
  
  def show_if_cell_has_bomb(neighbor_cell, cell)
    if neighbor_cell.bomb?
      cell.char = "1"
    else
      cell.char = "0"
    end
  end
end