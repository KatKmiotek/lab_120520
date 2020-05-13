class Pub
  attr_reader :name
  attr_accessor :till, :drinks

def initialize(name)
  @name = name
  @till = 0
  @drinks = []

end


def stock_count
  @drinks.count
end


def add_drink_to_stock(drink)
  @drinks.push(drink)
end

def reduce_stock_count
  @drinks.pop
end


def till_count
  @till
end

def increase_till(drink)
  @till += drink.price
end

def check_age(customer)
  if customer.age >= 18
    return true
  else
    return false
  end
end






end
