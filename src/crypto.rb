require 'digest'

class Block
  attr_reader :data
  attr_reader :hash

  def initialize(data)
    @data = data
    @hash = Digest::SHA512.hexdigest data
  end
end

def display_block(block)
  return "data: #{block.data}\nhash: #{block.hash}"
end

puts display_block Block.new("Hello World!")
