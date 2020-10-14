class ShoppingCart
  attr_reader :name, :capacity, :products  # => nil

  def initialize(name, capacity)
    @name = name                  # => "King Soopers"
    @capacity = capacity          # => "30items"
    @products = []
  end                             # => :initialize

  def capacity
    @capacity[0..1].to_i  # => 30
  end                     # => :capacity
end                       # => :capacity


cart = ShoppingCart.new("King Soopers", "30items")  # => #<ShoppingCart:0x00007f9b8d122c78 @name="King Soopers", @capacity="30items", @products=[]>
cart.capacity                                       # => 30
