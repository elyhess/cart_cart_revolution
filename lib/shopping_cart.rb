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

  def products_by_category(category)
    by_category = []
    @products.select do |product|
      if category == product.category
        by_category << product
      end
    end
  end

  def sorted_by_quantity
    sorted_by_quantity = products.sort_by do |product|
      product.quantity.to_i
    end
  end

  def product_breakdown
    breakdown = Hash.new {|hash, key| hash[key] = []}
    sorted_by_quantity.each do |product|
      breakdown[product.category.to_sym] << product
    end
    breakdown
  end
end
