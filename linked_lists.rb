# frozen_string_literal: true

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def find_tail
    node = @head
    return node if node.next_node.nil?

    return node unless node.next_node while (node = node.next_node)
  end

  def append(value)
    if @head
      find_tail.next_node = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  def prepend(value)
    node = Node.new(value)
    node.next_node = @head if @head
    @head = node
  end

  def size
    if @head
      counter = 1
      node = @head
      while node.next_node
        counter += 1
        node = node.next_node
      end
      counter
    else
      0
    end
  end

  def tail
    if @head
      node = @head
      node = node.next_node while node.next_node
      node
    end
  end

  def at(index)
    counter = 0
    node = @head
    until counter == index
      node = node.next_node
      counter += 1
    end
    node
  end

  def pop
    if @head
      node = @head
      node = node.next_node while node.next_node.next_node
      node.next_node = nil
    end
  end

  def contains?(value)
    node = @head
    while node
      if node.value == value
        return true
      elsif node.value != value
        node = node.next_node
      end
    end
    false
  end

  def find(value)
    node = @head
    counter = 0
    until node.value == value
      node = node.next_node
      counter += 1
    end
  rescue NoMethodError
    nil
  else
    counter
  end

  def to_s
    if @head
      node = @head
      while node
        print "(#{node.value}) -> "
        node = node.next_node
      end
      puts 'nil' if node.nil?
    else
      puts 'nil'
    end
  end

  def insert_at(value, index)
    new_node = Node.new(value)
    node = @head
    if index.zero?
      new_node.next_node = @head
      @head = new_node
    else
      counter = 0
      until counter == index - 1
        node = node.next_node
        counter += 1
      end
      new_node.next_node = node.next_node
      node.next_node = new_node
    end
  end

  def remove_at(index)
    node = @head
    if index.zero?
      @head = @head.next_node
    else
      counter = 0
      until counter == index - 1
        node = node.next_node
        counter += 1
      end
      node.next_node = node.next_node.next_node
    end
  end
end

list = LinkedList.new

list.append(5)
list.append(4)
list.append(3)
list.append(2)
list.prepend(1)
list.to_s
list.remove_at(2)
p list
list.to_s
list.insert_at(4, 2)
p list
list.to_s
