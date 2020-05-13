require('minitest/autorun')
require('minitest/reporters')
require_relative('../customer')
require_relative('../drink')
require_relative('../pub')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class TestCustomer < MiniTest::Test
  def setup()
    @customer = Customer.new("Bob", 100, 20)
    @customer2 = Customer.new("Samantha", 20, 15)
    @drink = Drink.new("peroni", 2, 4)
    @pub = Pub.new("Blue Lagoon")
  end

def test_drinks_count
  assert_equal(0, @customer.drinks_count)
end


def test_buy_drink
  @customer.buy_drink(@drink)
  assert_equal(1, @customer.drinks_count)
end


def test_reduce_wallet
  @customer.reduce_wallet(@drink)
  assert_equal(98, @customer.wallet)
end

def test_sale
  @pub.add_drink_to_stock(@drink)
  @pub.add_drink_to_stock(@drink)
  @customer.sale(@drink, @pub, @customer)
  assert_equal(false, @pub.check_age(@customer2))
  assert_equal(true, @pub.check_age(@customer))
  assert_equal(1, @customer.drinks_count)
  assert_equal(98, @customer.wallet)
  assert_equal(2, @pub.till_count)
  assert_equal(1, @pub.stock_count)
end



end
