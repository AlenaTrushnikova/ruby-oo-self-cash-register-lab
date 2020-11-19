require 'pry'

class CashRegister 
    attr_accessor :total, :discount, :items, :last_transaction_amount

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(sku, price, quantity=1)
        self.total += price * quantity
        quantity.times {items << sku}
    end

    def apply_discount
        if discount != 0
            self.total = (total * ((100.00 - discount.to_f)/100)).to_i
            return "After the discount, the total comes to $#{self.total}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        if last_transaction_amount = 0.0
            self.total = 0.0
        else
            self.total = self.total - self.last_transaction_amount
        end    
          
    end
end
