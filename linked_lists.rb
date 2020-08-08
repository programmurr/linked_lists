# frozen_string_literal: true

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
  end

class LinkedList
  attr_accessor :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    elsif @head.next_node.nil?
      @head.next_node = node
      @tail = node
    elsif !@head.next_node.nil? && @head.next_node == @tail
      # Recursively solve this?
      # Have a base return if next_node == nil?
      # Else, append?
    end
  end

  def prepend(value)
    # Adds a new node containing value to the start of the list
  end

  def size
    # Returns the total number of nodes in the list
  end

  # def head
  # Returns the first node in the list
  # end

  # def tail
  # Returns the last node in the list
  # end

  def at(index)
    # Returns the node at the given index
  end

  def pop
    # Removes the last element from the list
  end

  def contains?(value)
    # Returns true if the passed in value is in the list and otherwise returns false
  end

  def find(value)
    # Returns the index of the node containing value, or nil if not found
  end

  def to_s
    # Represent list objects as strings, so they can be printed out and previewed in the console.
    # The format should be: ( value ) -> ( value ) -> ( value ) -> nil
  end
end

list = LinkedList.new
p list
list.append(4)
p list
list.append(3)
p list
list.append(2)
p list
