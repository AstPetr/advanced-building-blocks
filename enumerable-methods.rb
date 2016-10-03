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
# Create #my_each_with_index in the same way.
    def my_each_with_index
    	i = 0
    	while i < self.length
    		if block_given?
    			yield(self[i], i)
    		else
    			return self
    		end
    		i +=1
    	end
    	self
    end
# Create #my_select in the same way, 
# though you may use #my_each in your definition (but not #each).
def my_select
	i = 0
	arr = Array.new
	self.my_each do |a| 
		if yield (a)
			arr[i] = a
			i +=1
		else
			false
		end
	end
	arr
end
# Create #my_all? (continue as above)
def my_all? 
	i = true
	self.my_each do |a|
		unless yield (a)
			i = false
			break
		end
	end
	i
end
# Create #my_any?
def my_any?
	i = false
	self.my_each do |a|
		if yield (a)
			i = true
			break
		end
	end
	i
end
# Create #my_none?
def my_none?
	i = true
	self.my_each do |a|
		if yield (a)
			i = false
			break
		end
	end
	i
end
# Create #my_count
def my_count?
	i = 0
	self.my_each do |a|
		i+=1 if yield(a)
	end
	i
end
# Create #my_map
def my_map(&proc)
	arr = []
	i = 0
	self.my_each do |a|
		proc.call(a)
		i += 1
	end
	arr
end
# Create #my_inject
def my_inject(i)
	if !i.nil?
		result = i 
	else
		result = 0
	end
	self.my_each do |n|
		result = yield(result, n)
	end
	result
end

# Modify your #my_map method to take a proc instead.

end

# Test your #my_inject by creating a method called #multiply_els 
# which multiplies all the elements of the array together by using 
# my_inject, e.g. multiply_els([2,4,5]) #=> 40
def multiply_els(arr)
	arr.my_inject(1) do |res, i| 
		res * i 
	end
end

a = [1,9,3,7,2]

b = a.my_count? do |i|
	!i.even?
end

c = a.my_none? do |n|
	n.even?
end

d = a.my_map do |i|
	i = i*2
end

e = a.my_inject(50)  { |result, element| result + element  }

f = multiply_els([2,4,5])

test_proc = Proc.new { |n| n + 1}
g = a.map(&test_proc)

puts g
# b.my_each_with_index do |a, i|
#    puts "#{a} ir index #{i}"
# end 
