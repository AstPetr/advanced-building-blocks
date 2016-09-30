def bubble_sort(array)
	sorted = 0	
	k = 0
	while (sorted != array.length)
		
		sorted = 0
		array.each_index do |i|
			if (i != array.length-1 && array[i] > array[i+1])
				k = array[i]
				array[i] = array[i+1]
				array[i+1] = k
			else
				sorted += 1
			end
		end
	end
	array
end

def bubble_sort_by(array)
	sorted = 0	
	k = 0
	while (sorted != array.length)
		
		sorted = 0
		array.each_index do |i|
			# yield(array[i], array[i+1])
			if (i != array.length-1 && yield(array[i], array[i+1]) > 0)
				k = array[i]
				array[i] = array[i+1]
				array[i+1] = k
			else
				sorted += 1
			end
		end
	end
    array
end

puts bubble_sort(["y", "l", "a"])

a = ["hi","hello","hey"]
bubble_sort_by(a) do |left,right|
	left.length - right.length
end

puts a