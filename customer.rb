class Customer
attr_accessor :name, :wallet, :drinks, :age

def initialize(name, wallet, age)
  @name = name
  @wallet = wallet
  @drinks = []
  @age = age
  @alcohol_level = 0
end

def drinks_count
  @drinks.count
end

def buy_drink(drink)
 @drinks.push(drink)
end

def reduce_wallet(drink)
  @wallet -= drink.price
end

def sale(drink, pub, customer)
  if pub.check_age(customer) == true
    buy_drink(drink)
    reduce_wallet(drink)
    pub.increase_till(drink)
    pub.reduce_stock_count
  else
    return "No sale"
  end
end


end
