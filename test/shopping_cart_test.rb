require 'minitest/autorun'               # => true
require 'minitest/pride'                 # => true
require '../lib/product'                 # => true
require '../lib/shopping_cart'           # => true
class ShoppingCartTest < Minitest::Test  # => Minitest::Test

  def test_it_exists_and_has_attributes
    cart = ShoppingCart.new("King Soopers", "30items")  # => #<ShoppingCart:0x00007ff0b987b750 @name="King Soopers", @capacity="30items", @products=[]>

    assert_instance_of ShoppingCart, cart   # => true
    assert_equal 'King Soopers', cart.name  # => true
    assert_equal 30, cart.capacity          # => true
    assert_equal [], cart.products          # => true
  end                                       # => :test_it_exists_and_has_attributes



end  # => :test_it_exists_and_has_attributes


# >> Run options: --seed 52845
# >>
# >> # Running:
# >>
# >> .
# >>
# >> Finished in 0.000698s, 1432.6646 runs/s, 5730.6584 assertions/s.
# >>
# >> 1 runs, 4 assertions, 0 failures, 0 errors, 0 skips
