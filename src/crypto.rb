require "digest"

class Block
  attr_reader :data
  attr_reader :hash
  attr_reader :nonce

  def initialize(data)
    @data = data
    @nonce, @hash = compute_hash_pow
  end

  def compute_hash_pow(difficulty = "00")
    nonce = 0
    loop do
      hash = Digest::SHA512.hexdigest "#{nonce}#{data}"
      if hash.start_with? difficulty
        return [nonce, hash]
      else
        nonce += 1
      end
    end # loop
  end # compute_hash_pow
end # Block

def display_block(block)
  return "data: #{block.data}\nhash: #{block.hash}\nnonce: #{block.nonce}"
end
