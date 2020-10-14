class Product
  attr_reader :category, :name, :quantity, :unit_price  # => nil

  def initialize(category, name, unit_price, quantity)
    @category = category                                # => :paper,         :meat
    @name = name                                        # => "toilet paper", "chicken"
    @unit_price = unit_price                            # => 3.7,            4.5
    @quantity = quantity                                # => "10",           "2"
  end                                                   # => :initialize

  def quantity
    @quantity.to_i  # => 10
  end               # => :quantity

  def total_price
    @quantity.to_i * @unit_price
  end                             # => :total_price

end  # => :total_price
