
require 'csv'

require_relative 'Products'
require_relative 'Cart'


class Shopping

	@p;

	@c;
	#p.createProductDb
    
	def initialize
	@p = Products.new
	@c = Cart.new

	end


	def displayOptions

	puts "Select from below"

	puts "1   Display All Products"
	puts "2   Select Products"
	puts "3   Display Cart"
	puts "4   Checkout"
    puts "\n"
    puts "\n"
    puts "\n"


	choice = gets.chomp
	puts choice
	

	case choice
	     when '1'
		       @p.displayProducts
		       displayOptions

         when '2'
                puts "Enter product id to buy"
                prod_id = gets.chomp
                puts "Enter quantity of product"
                qty = gets.chomp
                
                @c.addToCart(prod_id,qty)
                
                puts("Do you want to continue shopping? y/n")
 	            ans = gets.chomp
 	            if (ans=='y')
		             displayOptions
		        else
                     @c.displayCart
                     displayOptions 
 		        end


    	 when '3'
               @c.displayCart
               displayOptions

         when '4'
                 @c.buy  
                 displayOptions

    end

end


end
shop= Shopping.new

shop.displayOptions

