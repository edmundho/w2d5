class Fixnum
  # Fixnum#hash already implemented for you
end

class HashMemory
  attr_reader :memory
  def initialize
    @memory = {}
  end

  def save_hash(hash_output, hashed_item)
    @memory = Hash.new(nil)
    @memory[hashed_item] = hash_output
  end

  def hashed?(hashed_item)
    return true unless @memory[hashed_item].nil?
    false
  end


end

class Array
  attr_accessor :memory
  # def initialize
  #   @memory = HashMemory.new
  # end

  def hashed?(hashed_item)
    return true unless @memory[hashed_item].nil?
    false
  end



  def hash
    num = []
    self.each { |el| num << el }
    num = num.join.to_i
    num.hash

  end


end

class String
  def hash
    num = []
    self.each_char { |el| num << el.ord }
    num = num.join.to_i
    num.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    num = []
    self.values.sort.each { |el| num << el.ord }
    num = num.join.to_i
    num.hash
  end
end
