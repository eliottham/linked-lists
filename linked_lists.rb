class Node
	attr_accessor :value, :next
	def initialize(value=nil)
		@value = value
		@next = nil
	end
end

class LinkedList
	attr_reader :size, :head, :tail
	def initialize
		@head = nil
		@tail = nil
		@size = 0
	end

	def append(value)
		new_node = Node.new(value)
		if @head == nil							#If the list is empty, the new
			@head = new_node					#node becomes the head and tail
			@tail = new_node
			@size += 1		
		else
			@tail.next = new_node				#Finds the current tail and makes its 
			@tail = new_node
			@size += 1							#next pointer point to the new tail. new_node
		end										#is now the new tail
	end

	def prepend(value)
		new_node = Node.new(value)
		if @head == nil
			@head = new_node
			@tail = new_node
			@size += 1
		else									
			new_node.next = @head				#Sets the new node's next pointer to the current head
			@head = new_node					#Sets the new head as the new node
			@size += 1
		end
	end

	def at(index)
		counter = 0
		current_node = @head
		if index > @size - 1
			puts "ERROR: Index does not exist."
		else
			until counter == index   				#Uses a temporary head to go through the linked list until
				next_node = current_node.next 		#the counter = index
				current_node = next_node
				counter += 1
			end
			return current_node.value
		end
	end

	def pop
		current_node = @head
		until current_node.next == @tail	    #Goes through the list until the node before the tail	
			next_node = current_node.next
			current_node = next_node
		end
		@tail = current_node					#Set the node before the tail as the new tail
		@tail.next = nil						#Set the new tail's next pointer to nil
		@size -= 1
	end

	def contains?(value)
		current_node = @head
		@index = 0
		@size.times do 
			if current_node.value == value
				return true
			else
				next_node = current_node.next
				current_node = next_node
				@index += 1
			end
		end
		return false
	end

	def find(data)
		if contains?(data) == true
			return @index
		else
			return false
		end
	end

	def to_s
		current_node = @head
		@size.times do
			if current_node == @tail
				print "( #{current_node.value} )"
			else
				print "( #{current_node.value} ) -> "
				next_node = current_node.next
				current_node = next_node
			end
		end
	end
end

a = LinkedList.new
a.append(16)
a.append(42)
a.pop
a.prepend("HI")
a.to_s
puts "\n #{a.find(4)}"













