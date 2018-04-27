  class MaxIntSet
    attr_reader :store, :max
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
   raise "Out of bounds" if num > @max - 1 || num < 0
   @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { [] }
  end

  def insert(num)
    @store[num % num_buckets] << num
    # @store[num] << num
  end

  def remove(num)
    @store[num % num_buckets].delete(num)
  end

  def include?(num)
    @store[num % num_buckets].any? { |el| el == num }
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    num % num_buckets
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
    @store[num % num_buckets] << num
    @count += 1
    resize! if @count == num_buckets
    end
  end

  def remove(num)
    if include?(num)
    @count -= 1
    @store[num % num_buckets].delete(num)
    end
  end

  def include?(num)
    @store[num % num_buckets].any? { |el| el == num }
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_num_buckets = num_buckets * 2
      new_store = Array.new(new_num_buckets) {[]}
      @store.each do |bucket|
        bucket.each do |el|
          new_store[ el % new_num_buckets] << el
        end
    end
    @store = new_store
  end
end
