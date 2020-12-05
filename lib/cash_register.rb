class CashRegister

    attr_accessor :total, :discount, :items
    attr_reader :prices

    def initialize(discount = 0)
        @total = 0.0
        @discount = discount
        @items = []
        @prices = []
    end
    
    def add_item (title, price, quantity = 1)
        transaction_total = price * quantity
        quantity.times do
            @total += price
            @items << title
        end
        @prices << transaction_total
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
        @total = @total - ( @total * (@discount.to_f/100.0) )
        "After the discount, the total comes to $#{@total.round}."
        end
    end

    def void_last_transaction
        @items.pop
        @total -= @prices.pop
    end
end