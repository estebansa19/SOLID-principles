=begin
En este claso estamos viendo una clase que tiene como responsabilidad generar reportes, en caso de
que se tenga que realizar una modificación en este código tendremos que modificar la clase
directamente y, por ende, va a ser más complicado entender toda la lógica que ya hay en esta clase
y además, podemos generar bugs.
=end

class ReportGenerator
  def self.generate(user)
    if user.admin?
      # logic to generate a report for the admin user
    else
      # login to generate a report for a common user
    end
  end
end


=begin
De esta otra manera, tenemos una clase propia por cada tipo de generador, por lo que, si tenemos
que hacer un cambio en el generador de los usuarios de tipo admin, no tendremos que modificar la
clase completa; además, se está accediendo de manera dinámica a la clase del generador que debe
usarse por lo que será mucho más sencillo en futuro añadir un nuevo tipo de reporte.
=end

class AdminReportGenerator
  def self.generate(user)
    # logic to generate the report
  end
end

class CommonUserReportGenerator
  def self.generate(user)
    # logic to generate the report
  end
end

class ReportGenerator
  GENERATORS = {
    'admin' => AdminReportGenerator,
    'common_user' => CommonUserReportGenerator
  }

  def self.generate(user)
    GENERATORS[user.type].generate(user)
  end
end
