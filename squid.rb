require 'sinatra'
require 'sinatra/contrib/all'
require_relative 'models/transaction.rb'
require_relative 'models/account.rb'
require_relative 'models/category.rb'

get '/' do
  @transactions = Transaction.all()
  erb(:index)
end
