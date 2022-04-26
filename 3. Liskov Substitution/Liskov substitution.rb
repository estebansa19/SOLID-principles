=begin
En este caso tenemos una clase padre que es Producto y una clase hija que es InHouseProduct que
implementa un método propio que es apply_extra_discount. Como se puede ver en la clase PriceUtils
tenemos que hacer un typecast check para saber si el objeto es de la clase de InHouseProduct para
ejecutar este comportamiento, lo cual incumple con este principio, tanto un objeto de la clase
padre como uno de la clase hija deberían poder tratarse de la misma manera y no preguntar si un
objeto es de x clase u otra.
=end

class Product
  def initialize
    @discount = 20
  end

  def get_discount
    @discount
  end
end

class InHouseProduct < Product
  def apply_extra_discount
    @discount = @discount * 1.5
  end
end

class PriceUtils
  def call
    p1 = Product.new
    p2 = Product.new
    p3 = InHouseProduct.new
    products = [p1, p2, p3]

    products.each do |product|
      if product.is_a?(InHouseProduct)
        product.apply_extra_discount
      end

      puts product.get_discount
    end
  end
end


=begin
Con los cambios realizados ahora, se sobreescribió el método de get_discount en InHouseProduct y
hace un llamado dentro de sí mismo que ejecuta el método apply_extra_discount, de esta manera los
no se va a tener que hacer un typecast check para saber si un objeto es de una clase u otra, no
vamos a tener que preguntar si un objeto es de una clase y hacer algo específico en ese caso,
simplemente llamamos el método get_discount.
=end

class Product
  def initialize
    @discount = 20
  end

  def get_discount
    @discount
  end
end

class InHouseProduct < Product
  def get_discount
    apply_extra_discount
    @discount
  end

  def apply_extra_discount
    @discount = @discount * 1.5
  end
end

class PriceUtils
  def call
    p1 = Product.new
    p2 = Product.new
    p3 = InHouseProduct.new
    products = [p1, p2, p3]

    products.each { |product| product.get_discount }
  end
end

a = PriceUtils.new.call
