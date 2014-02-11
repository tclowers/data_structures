class Node
	attr_accessor :value, :last

	def initialize(value = nil, last = nil)
		@value = value
		@last = last
	end
end

class LinkedList
	attr_accessor :counter

	def initialize
		@counter = 0
		@head = nil
	end

	def add(value)
		@counter += 1
		@last = @head = Node.new(value, @last)
	end

	def size
		return @counter
	end

	def contains?(value)
		traverse { |current_val| return true if current_val == value }
		return false
	end

	def to_a
		array = []
		traverse { |current_val| array.unshift(current_val) }
		return array
	end

	def traverse
		current_node = @head
		while current_node != nil
			yield(current_node.value)
		   current_node = current_node.last
		end
	end

	def remove(value)
		if @head.value == value
			@head = @head.last
		else
			next_node = @head
			current_node = @head.last
			while current_node != nil
				if current_node.value == value
					next_node.last = current_node.last
					return true
				end
				next_node = current_node
				current_node = current_node.last
			end
		end
	end
end