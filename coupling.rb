=begin
  Antes

  La clase de Student está altamente acoplada al method de save_to_database, este tiene que lidiar
  con detalles de muy bajo nivel de la DB. Por lo que, ante cualquier cambio, este método va a
  tener que ser modificado.

  Este alto acoplamiento, como podemos ver, es una característica que debemos evitar. La clase de
  Student aparte de tener que administrar las características de los estudiantes tiene que lidiar
  con otras cosas que no son su responsabilidad.
=end

class Student
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def save_to_database
    puts "Saving #{name} to database"
  end
end


=begin
  Después

  De esta manera conservamos la cohesión en la clase del Student y también en la clase de
  SaveStudentToDatabase. Si, por ejemplo, quisiéramos cambiar de motor de DB esto se haría en la
  clase de SaveStudentToDatabase y la clase de Student sería agnóstica a este cambio.
=end

class Student
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def save_to_database
    SaveStudentToDatabase.call(self)
  end
end

class SaveStudentToDatabase
  def self.call(student)
    # Save the record to the DB.
  end
end
