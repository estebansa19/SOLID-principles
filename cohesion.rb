=begin
  Antes

  calculate_area y calculate_perimeter son métodos que tienen una alta cohesión. draw y rotate son
  métodos que tienen una alta cohesión entre sí pero no con los otros métodos ni con la clase.
=end

class Square
  attr_reader :side

  def initialize(side=5)
    @side = side
  end

  def calculate_area
    side * side
  end

  def calculate_perimeter
    side * 4
  end

  def draw
    # code for rendering a image of the square.
  end

  def rotate
    # rotate the rendered image and re-render.
  end
end


=begin
  Después

  Ahora los métodos de draw y rotate fueron movidos a la clase SquareUI, que es una clase que tiene
  enfocada a temas gráficos de los squares, por lo que tienen más cohesión entre sí.
=end

class Square
  attr_reader :side

  def initialize(side=5)
    @side = side
  end

  def calculate_area
    side * side
  end

  def calculate_perimeter
    side * 4
  end
end

class SquareUI
  def draw
    # code for rendering a image of the square.
  end

  def rotate
    # rotate the rendered image and re-render.
  end
end

