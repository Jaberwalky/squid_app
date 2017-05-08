require 'sinatra'
require 'sinatra/contrib/all'
require_relative 'controllers/transactions_controller.rb'
require_relative 'controllers/categories_controller.rb'

get '/squid' do
  @categories = Category.all()
  @transactions = Transaction.all()
  @accounts = Account.all()
  erb(:index)
end



# how do I ensure two decimal points are placed after amounts on my table?
# how can I set up two routes against the same class. One for adding a card and one for adding to the balance?
