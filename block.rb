require 'digest'

class Blockchain

  def initialize
  	block = {
	  'index' => 1,
	  'time' => Time.now,
	  'nonce' => '유병철 짱',
	  'previous_block' => 0
	}
    @chain = [block]
  end

  def mining
	begin
	  nonce = rand(100)
	end while (nonce %2 != 0) || (nonce %5 != 0)
	
	block = {
	  'index' => @chain.length + 1,
	  'time' => Time.now,
	  'nonce' => nonce,
	  'previous_block' => Digest::SHA256.hexdigest(last_block.to_s)
	}
	@chain << block
  end
  
  def current_chain
    @chain
  end
  
  def last_block
    @chain[-1]
  end
end