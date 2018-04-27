class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @next.prev = @prev
    @prev.next = @next

  end
end

class LinkedList
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next, @tail.prev = @tail, @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @tail.prev
  end

  def last
    @head.next
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    current = @head
    until current == @tail
      if current.key.nil?
      current = @head.next
      next
      end
      return current.val  if current.key == key
      current = current.next
    end
  end

  def include?(key)
  end

  def append(key, val)
    new_node = Node.new(key, val)
    @head.next.prev = new_node
    new_node.next = @head.next
    @head.next = new_node
    new_node.prev = @head
  end

  def update(key, val)
    current = @head
    until current == @tail
      if current.key.nil?
      current = @head.next
      next
      end
      current.val = val  if current.key == key
      current = current.next
    end

  end

  def remove(key)
    current = @head
    until current == @tail
      puts 'current node'
      p current.key
      if current.key.nil?
      current = @head.next
      next
      end
      current.remove  if current.key == key
      current = current.next
    end
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
