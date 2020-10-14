require 'minitest/autorun'               # => true
require 'minitest/pride'                 # => true
require '../lib/product'                 # => true
require '../lib/shopping_cart'           # => true
class ShoppingCartTest < Minitest::Test  # => Minitest::Test

  def test_it_exists_and_has_attributes
    cart = ShoppingCart.new("King Soopers", "30items")  # => #<ShoppingCart:0x00007fd88e08e3a0 @name="King Soopers", @capacity="30items", @products=[], @details={:name=>nil, :capacity=>0}>

    assert_instance_of ShoppingCart, cart   # => true
    assert_equal 'King Soopers', cart.name  # => true
    assert_equal 30, cart.capacity          # => true
    assert_equal [], cart.products          # => true
  end                                       # => :test_it_exists_and_has_attributes

  def test_it_adds_products
    cart = ShoppingCart.new("King Soopers", "30items")          # => #<ShoppingCart:0x00007fd88e08cf78 @name="King Soopers", @capacity="30items", @products=[], @details={:name=>nil, :capacity=>0}>
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')  # => #<Product:0x00007fd88e08cb18 @category=:paper, @name="toilet paper", @unit_price=3.7, @quantity="10">
    product2 = Product.new(:meat, 'chicken', 4.50, '2')         # => #<Product:0x00007fd88e08c730 @category=:meat, @name="chicken", @unit_price=4.5, @quantity="2">

    cart.add_product(product1)  # => [#<Product:0x00007fd88e08cb18 @category=:paper, @name="toilet paper", @unit_price=3.7, @quantity="10">]
    cart.add_product(product2)  # => [#<Product:0x00007fd88e08cb18 @category=:paper, @name="toilet paper", @unit_price=3.7, @quantity="10">, #<Product:0x00007fd88e08c730 @category=:meat, @name="chicken", @unit_price=4.5, @quantity="2">]

    assert_instance_of Product, cart.products.first  # => true
  end                                                # => :test_it_adds_products

  def test_it_has_details
    cart = ShoppingCart.new("King Soopers", "30items")          # => #<ShoppingCart:0x00007fd88e087668 @name="King Soopers", @capacity="30items", @products=[], @details={:name=>nil, :capacity=>0}>
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')  # => #<Product:0x00007fd88e086fd8 @category=:paper, @name="toilet paper", @unit_price=3.7, @quantity="10">
    product2 = Product.new(:meat, 'chicken', 4.50, '2')         # => #<Product:0x00007fd88e086c40 @category=:meat, @name="chicken", @unit_price=4.5, @quantity="2">

    expected = {name: "King Soopers", capacity: 30}  # => {:name=>"King Soopers", :capacity=>30}
    result = cart.details                            # => {:name=>"King Soopers", :capacity=>30}

    assert_equal expected, result  # => true
  end                              # => :test_it_has_details

  def test_it_is_full
    cart = ShoppingCart.new("King Soopers", "30items")          # => #<ShoppingCart:0x00007fd88e097770 @name="King Soopers", @capacity="30items", @products=[], @details={:name=>nil, :capacity=>0}>
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')  # => #<Product:0x00007fd88e0971d0 @category=:paper, @name="toilet paper", @unit_price=3.7, @quantity="10">
    product2 = Product.new(:meat, 'chicken', 4.50, '2')         # => #<Product:0x00007fd88e096e38 @category=:meat, @name="chicken", @unit_price=4.5, @quantity="2">
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')   # => #<Product:0x00007fd88e096ac8 @category=:paper, @name="tissue paper", @unit_price=1.25, @quantity="1">

    cart.add_product(product1)  # => [#<Product:0x00007fd88e0971d0 @category=:paper, @name="toilet paper", @unit_price=3.7, @quantity="10">]
    cart.add_product(product2)  # => [#<Product:0x00007fd88e0971d0 @category=:paper, @name="toilet paper", @unit_price=3.7, @quantity="10">, #<Product:0x00007fd88e096e38 @category=:meat, @name="chicken", @unit_price=4.5, @quantity="2">]
    cart.add_product(product3)  # => [#<Product:0x00007fd88e0971d0 @category=:paper, @name="toilet paper", @unit_price=3.7, @quantity="10">, #<Product:0x00007fd88e096e38 @category=:meat, @name="chicken", @unit_price=4.5, @quantity="2">, #<Product:0x00007fd88e096ac8 @category=:paper, @name="tissue paper", @unit_price=1.25, @quantity="1">]

    assert_equal 13, cart.total_number_of_products  # => true
    assert_equal false, cart.is_full?               # => true
  end                                               # => :test_it_is_full

  def test_products_by_cat
    cart = ShoppingCart.new("King Soopers", "30items")          # => #<ShoppingCart:0x00007fd88e094fe8 @name="King Soopers", @capacity="30items", @products=[], @details={:name=>nil, :capacity=>0}>
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')  # => #<Product:0x00007fd88e094ae8 @category=:paper, @name="toilet paper", @unit_price=3.7, @quantity="10">
    product2 = Product.new(:meat, 'chicken', 4.50, '2')         # => #<Product:0x00007fd88e094728 @category=:meat, @name="chicken", @unit_price=4.5, @quantity="2">
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')   # => #<Product:0x00007fd88e094390 @category=:paper, @name="tissue paper", @unit_price=1.25, @quantity="1">

    cart.add_product(product1)  # => [#<Product:0x00007fd88e094ae8 @category=:paper, @name="toilet paper", @unit_price=3.7, @quantity="10">]
    cart.add_product(product2)  # => [#<Product:0x00007fd88e094ae8 @category=:paper, @name="toilet paper", @unit_price=3.7, @quantity="10">, #<Product:0x00007fd88e094728 @category=:meat, @name="chicken", @unit_price=4.5, @quantity="2">]
    cart.add_product(product3)  # => [#<Product:0x00007fd88e094ae8 @category=:paper, @name="toilet paper", @unit_price=3.7, @quantity="10">, #<Product:0x00007fd88e094728 @category=:meat, @name="chicken", @unit_price=4.5, @quantity="2">, #<Product:0x00007fd88e094390 @category=:paper, @name="tissue paper", @unit_price=1.25, @quantity="1">]

    assert_equal 2, cart.products_by_category(:paper).count  # => true
  end                                                        # => :test_products_by_cat



end  # => :test_products_by_cat

# >> Run options: --seed 1555
# >>
# >> # Running:
# >>
# >> .....
# >>
# >> Finished in 0.001856s, 2693.9656 runs/s, 4849.1381 assertions/s.
# >>
# >> 5 runs, 9 assertions, 0 failures, 0 errors, 0 skips
