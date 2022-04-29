# código para implementar interfaces

module Interface
  def method(name)
    define_method(name) do |*args|
      raise "interface method #{name} not implemented"
    end
  end
end

=begin
En este primer caso, tenemos una interfaz llamada MultiFunction que implementa todo el
comportamiento del XeroxWorkCentre. En este caso, estamos obligando a que clases que no tienen este
comportamiento de la interfaz la definan, por ejemplo, estamos obligando al CanonPrinter a tener
métodos de un fax y de escaneo cuando en realidad no los tiene.
=end

module MultiFunction
  extend Interface

  method :print
  method :get_print_spool_details
  method :scan
  method :scan_photo
  method :fax
  method :internet_fax
end

class XeroxWorkCentre
  include MultiFunction

  def print
    # real code
  end

  def get_print_spool_details
    # real code
  end

  def scan
    # real code
  end

  def scan_photo
    # real code
  end

  def fax
    # real code
  end

  def internet_fax
    # real code
  end
end

class HPPrinterScanner
  include MultiFunction

  def print
    # real code
  end

  def get_print_spool_details
    # real code
  end

  def scan
    # real code
  end

  def scan_photo
    # real code
  end

  def fax
  end

  def internet_fax
  end
end

class CanonPrinter
  include MultiFunction

  def print
    # real code
  end

  def get_print_spool_details
    # real code
  end

  def scan
  end

  def scan_photo
  end

  def fax
  end

  def internet_fax
  end
end

=begin
En este segundo caso, segregamos las responsabilidades en 3 interfaces distintas: Print, Fax y
Scan, de esta manera hicimos que las clases implementen por medio de las interfaces el
comportamiento que sí les corresponde. Así no tenemos que realizar una implementación de métodos
vacíos en nuestras clases y será mucho más fácil de entender qué debería hacer cada una de estas.
=end

module Print
  extend Interface

  method :print
  method :get_print_spool_details
end

module Scan
  extend Interface

  method :scan
  method :scan_photo
end

module Fax
  extend Interface

  method :fax
  method :internet_fax
end

class XeroxWorkCentre
  include Print
  include Scan
  include Fax

  def print
    # real code
  end

  def get_print_spool_details
    # real code
  end

  def scan
    # real code
  end

  def scan_photo
    # real code
  end

  def fax
    # real code
  end

  def internet_fax
    # real code
  end
end

class HPPrinterScanner
  include Print
  include Scan

  def print
    # real code
  end

  def get_print_spool_details
    # real code
  end

  def scan
    # real code
  end

  def scan_photo
    # real code
  end
end

class CanonPrinter
  include Print

  def print
    # real code
  end

  def get_print_spool_details
    # real code
  end
end
