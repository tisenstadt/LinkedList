require 'minitest/autorun'
require_relative 'linkedlist.rb'

class TestLinkedList < Minitest::Test
	def setup
		@list = LinkedList.new(Node.new(7))
	end

	def test_presence_of_node
		@node = Node.new(7)
		assert @node
		assert @node.value == 7
	end
	
	def test_presence_of_linkedlist	
		assert @list
		assert !@list.head.nil?
		assert @list.head.value == 7		
	end
	
	def test_can_add_node
		@list.add_node(5)	
		@list.add_node(32)
		current_head = @list.head
		assert_equal current_head.value, 7
		until current_head.next.nil?			
			current_head = current_head.next
		end
		assert current_head.value == 32
	end
	
	def test_can_delete_single_node
		@list.add_node(9)
		@list.add_node(17)
		@list.remove_single_node(9)
		current_node = @list.head
		until current_node.next == nil		
			assert current_node.value != 9
			current_node = current_node.next
		end
			assert current_node.value != 9		
	end
	
	def test_can_perform_reverse		
		@list.add_node(11)
		@list.add_node(20)
		current_head = @list.head
		new_list = @list.recursive_reverse
		p @list.head
		assert current_head != new_list
	end
	
	def test_to_create_array
		@list.add_node(11)
		@list.add_node(20)	
		assert_equal @list.array_of_values.size, 3
		assert_equal @list.array_of_values[-1], 20  				
	end
	
	def test_to_check_palindrome
		palindrome = ['d','e','i','f','i','e','d']
		@list = LinkedList.new(Node.new(palindrome[0]))
		palindrome[1..-1].each do |letter|
			@list.add_node(letter)
		end
		assert @list.is_palindrome?
		@list.add_node('d')
		assert !@list.is_palindrome?		
	end
end
		