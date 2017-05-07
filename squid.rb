require 'sinatra'
require 'sinatra/contrib/all'
require_relative 'controllers/transactions_controller.rb'

get '/squid' do
  @transactions = Transaction.all()
  erb(:index)
end
