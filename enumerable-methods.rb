module Enumerable
	def my_each
		i = 0
		while (i < self.length)
			if block_given?
				yield(self[i]) 
			else
				return self
			end
			i +=1
		end
		self
	end
end

a = [1,2,3,4,5]
b = a.my_each do |i|
   puts i+1
end 
puts "end"
puts b
# puts "End"