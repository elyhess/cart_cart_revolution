class ShoppingCart
  attr_reader :name, :capacity, :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
    @details = {name: nil, capacity: 0}
  end

  def name
    @name
  end

  def capacity
    @capacity[0..1].to_i
  end

  def add_product(product)
    @products << product
  end

  def details
    @details[:name] = name
    @details[:capacity] = capacity
    @details
  end

  def total_number_of_products
    @products.sum do |product|
      product.quantity
    end
  end

  def is_full?
    total_number_of_products == capacity
  end
end
