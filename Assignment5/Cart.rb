require 'csv'

class Cart

@product_id;
@quantity;
@db;
@table_cart;

def initialize
   			 CSV.open('Cart.csv', 'w') do |csv|
                 

               end

end	

def addToCart (prod_id,qty)
	
	productresult = Array.new

        CSV.foreach('products.csv') do |record|

       			 productresult << record

        end
        productRow= productresult.select{|e| e[0]==prod_id}
        puts productRow
        
        cost= (productRow[2].to_i)* qty
        	   
        puts "Cost is "
        puts cost

        record=[[productRow[1],qty,cost]]

	CSV.open('Cart.csv', 'w') do |csv|

    	record.each {|rec| csv << rec}

     end

    puts "Product added to your cart"
end



def displayCart
				@cartresult = Array.new

		        CSV.foreach('Cart.csv') do |record|

		        @cartresult << record

        		end
		
		@Totalcost=0

	puts "Product       Quantity        Cost"
	@cartresult.each do|item|
				@Totalcost=@Totalcost * (item[2].to_i)
                puts item.join "\s"

          	end
	#cartresult.each do|name,qant, priceing|
	#		cost= priceing* qant
	#		@Totalcost= @Totalcost + cost	
	#	puts "#{name}, #{qant}, #{cost}"
		
	#end
	puts "Total Cost of your purchase:#{@Totalcost}"
end


def buy
	cartItems = Array.new

		        CSV.foreach('Cart.csv') do |record|

		        @cartresult << record

        		end
	

	cartItems.each do | prod_id,qty|

		result = Array.new
     
        CSV.foreach('products.csv') do |record|

        result << record

        end
    
		result.each do |id,name,price,prodQty|
			finalQty=prodQty-qty
			
			end	
    end
           

	end

end


