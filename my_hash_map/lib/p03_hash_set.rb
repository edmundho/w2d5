require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    hash = key.hash
    unless include?(key)
    @store[hash % num_buckets] << key
    @count += 1
    resize! if @count == num_buckets
    end
  end

  def include?(key)
    hash = key.hash

    @store[hash % num_buckets].any? { |el| el == key }
  end

  def remove(key)
    hash = key.hash
    if include?(key)
    @count -= 1
    @store[hash % num_buckets].delete(key)
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
