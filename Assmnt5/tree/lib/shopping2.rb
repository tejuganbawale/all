
require 'csv'



class Shopping

	@p;

	@c;
	
    
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
	#puts choice
	

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



class Cart

@product_id;
@quantity;


def initialize
   			 CSV.open('Cart.csv', 'ab') do |csv|
                 

               end

end	

def addToCart (prod_id,qty)
	
	productresult = Array.new

        CSV.foreach('products.csv') do |record|

       			 productresult << record

        end
        productRow= productresult.select{|e| e[0]==prod_id}
        #puts productRow
       
        #puts productRow[0][2]
        cost= productRow[0][2].to_i * qty.to_i
        	   
        puts "Cost is "
        puts cost
        

        cartrecords=[[productRow[0][1].to_s,qty,cost]]

	    CSV.open('Cart.csv', "ab") do |csv|

    	cartrecords.each {|rec| csv << rec}

     end

    puts "Product added to your cart"
end



def displayCart
				cartresult = Array.new

		        CSV.foreach('Cart.csv') do |record|

		        cartresult << record

        		end
		
		
		
	puts "Product       Quantity        Cost"
	cartresult.each do|item|
                puts item.join "     "
                puts"\s"
          	end

end


def buy
	cartItems = Array.new

		        CSV.foreach('Cart.csv') do |record|

		        cartItems << record

                
        		end

        		#puts cartItems
        		#puts cartItems[0]
        		#puts cartItems[0][0]
	result = Array.new
     
			        CSV.foreach('products.csv') do |record1|

			        result << record1
					end	
     
    result.each do |r|
    	cartItems.each do |c|
    	if r[1]==c[0]
    		r[3]=r[3].to_i-c[1].to_i
    	end
    end	
    end		


	#puts result

	result.each do|item|
                puts item.join "   "
                puts"\n"
          	end
			
	# for making cart empty


 CSV.open('Cart.csv', 'w') do |csv|
                 
                  
               end
 


end
end
class Products


def initialize
    products=[ [1,'Da Vinci Code book', 250, 25],
               [2,'HP laptop', 50000, 10],
               [3,'Hibiscus shampoo', 150, 20],
               [4,'Cotton shirt', 1000, 30]]
             CSV.open('products.csv', 'w') do |csv|

                   products.each {|record| csv << record }

               end

end	


# display the list of available products

def displayProducts
    

result = Array.new

        CSV.foreach('products.csv') do |record|

        result << record

        end
   
	puts "ID        Product         Price         Qty."
          	result.each do|item|
                puts item.join "   "
                puts"\n"
          	end

end

end





shop= Shopping.new

shop.displayOptions
