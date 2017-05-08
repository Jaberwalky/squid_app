require 'sinatra'
require 'sinatra/contrib/all'
require_relative 'controllers/transactions_controller.rb'
require_relative 'controllers/categories_controller.rb'
require_relative 'controllers/accounts_controller.rb'

get '/squid' do
  @categories = Category.all()
  @transactions = Transaction.all()
  @accounts = Account.all()
  erb(:index)
end
