require 'pry'

class CashRegister
attr_accessor :total, :items, :quantity, :last_transaction
attr_reader :discount

def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
end

def add_item (title,price,quantity=1)
    self.last_transaction = price * quantity
    self.total += self.last_transaction
    quantity.times do 
        self.items << title  
    end
end

def apply_discount
    if self.discount > 0
    discounted_price = (self.discount.to_f / 100) * self.total
    # binding.pry
    self.total -= discounted_price.to_i
    "After the discount, the total comes to $#{self.total}."
    else
        "There is no discount to apply."
end
end

def void_last_transaction
    self.total -= self.last_transaction 
end
end