
require 'csv'
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


