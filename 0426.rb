require 'sinatra'
require './block'

b = Blockchain.new

get '/' do
  message = ""
  b.current_chain.each do |c|
  message << "the index value is " + c['index'].to_s + "<br>"
	message << "the nonce value is " + c['nonce'].to_s + "<br>"
	message << "the time is " + c['time'].to_s + "<br>"
	message << "last address is " + c['previous_block'].to_s + "<br>"
	message << "my address is " + Digest::SHA256.hexdigest(c.to_s) + "<br>"
	message << "<hr>"
  end
  
  message
end

get '/mine' do
  b.mining
  "I found blocks"
end