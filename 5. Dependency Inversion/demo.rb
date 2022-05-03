=begin
En este caso, la clase de ProductCatalog que es un componente de alto nivel está dependiendo de un
componente de bajo nivel que es SQLProductRepository, esto es una clara violación al principio.
=end

# low level component
class SQLProductRepository
  def get_all_product_names
    %w[soup candy soda]
  end
end

# high level component
class ProductCatalog
  def list_all_products
    SQLProductRepository.new.get_all_product_names
  end
end


=begin
Ahora en este segundo caso, ya no se tiene la dependencia entre un componente de alto nivel y uno
de bajo nivel, en su lugar, ahora ambos tienen la dependencia con una abstracción, lo que revierte
la cardinalidad de las dependencias a esta clase abstracta. Se creó una interfaz y una clase
Factory que va a actuar como agente intermedio para poder hacer que se cumpla el principio.
=end

# interface
module ProductRepository
  def get_all_product_names
    raise NotImplementedError
  end
end

# low level component
class SQLProductRepository
  include ProductRepository

  def get_all_product_names
    %w[soup candy soda]
  end
end

# factory class
class ProductFactory
  def self.create
    SQLProductRepository.new
  end
end

# high level component
class ProductCatalog
  def list_all_products
    product_repository = ProductFactory.create

    product_repository.get_all_product_names
  end
end
