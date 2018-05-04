require 'pry'
class CashRegister

  attr_accessor :discount, :total, :price, :last_price

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def self.total(total = 100)
    @total = total
  end

  def add_item(title, price, quantity = 1)
    @total += price*quantity
    @last_price = price*quantity
    if quantity > 1
      quantity.times do |i|
      @items << title
      end
    else
      @items << title
    end
  end

def apply_discount
  if @discount == nil
    "There is no discount to apply."
  else
    sale = @total*(@discount.to_f/100)
    @total -= sale
    "After the discount, the total comes to $#{@total.to_i}."
  end
end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_price
  end

end
