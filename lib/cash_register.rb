class CashRegister
    # .new sets an instance variable @total on initialization to zero
    # .new takes one optional argument, an employee discount, on initialization
    attr_accessor :total, :discount
    def initialize(discount = 20, total = 0)
        @total = total
        @discount = discount
    end

    #add_item accepts a title and a price and increases the total 
    def add_item(title, price, quantity = 1)
        @total += price * quantity
    end

    #apply_discount when the cash register was initialized with an employee discount applies the discount to the total price 
    def apply_discount
        if @discount != 0
            @total = @total - (@total * @discount / 100)
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    # items when called with two arguments returns an array containing all items that have been added
    # when called with three arguments returns an array containing all items that have been added, including multiples
    def items(title = nil, price = nil, quantity = nil)
        if title && price && quantity
            @items = [title] * quantity
        elsif title && price
            @items = [title]
        else
            @items = []
        end
    end

    # void_last_transaction subtracts the last item from the total
    # returns the total to 0.0 if all items have been removed
    def void_last_transaction
        @total -= @items.last
        @items.pop
    end
    

end
