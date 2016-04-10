class Node
	attr_accessor :value, :next
	def initialize(value)
		@value = value
	end
end

class LinkedList
	#Initialized to include a value for the head. 
	attr_accessor :head
	def initialize(head)
		@head = head
	end
	
	def add_node(value)
		current_node = @head
		until current_node.next.nil?
			current_node = current_node.next
		end
		current_node.next = Node.new(value)
	end
	
	def remove_single_node(delete_value)
		if @head.value == delete_value
			@head = @head.next
			return
		else
			current_node = @head
			until current_node.next.nil?
				if current_node.next.value == delete_value
					current_node.next = current_node.next.next
					return
				else
					current_node = current_node.next
				end
			end
			puts "Value #{delete_value} does not exist. Failed to delete node."
		end
	end
	
	def print_values
		p @head.value
		return if @head.next.nil?
		current_node = @head.next 		
		until current_node.next.nil?
			p current_node.value
			current_node = current_node.next
		end
		p current_node.value
	end
	
	
	def cheap_reverse
		old_list = array_of_values.reverse	
		@new_list = LinkedList.new(Node.new(old_list[0]))		
		old_list[1..-1].each do |value|
			new_list.add_node(value)			
		end
		new_list.print_values			
	end
	
	def recursive_reverse(new_head=nil, current_node=nil)	
		#Return immediately if list length is 1.
		return if @head.next.nil? and new_head.nil?
		if new_head.nil?			
			current_node = @head
			next_head = @head.next
			current_node.next = nil			
			recursive_reverse(next_head, current_node)
		elsif !new_head.next.nil?
			next_head = new_head.next
			new_head.next = current_node					
			recursive_reverse(next_head, new_head)
		else
			new_head.next = current_node
			@head = new_head		
			return @head
		end		
	end
	
	def is_palindrome?	
		before_reverse = @head
		before_values = array_of_values	
		after_reverse = recursive_reverse
		after_values = array_of_values
		return true if before_values == after_values
	end
	
	def array_of_values
		values = Array.new
		current_node = @head
		values << current_node.value
		until current_node.next.nil?
			current_node = current_node.next
			values << current_node.value
		end
		return values
	end	
end
			
			





		