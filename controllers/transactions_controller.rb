require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/transaction.rb'
require_relative '../models/category.rb'
require_relative '../models/account.rb'

get '/transactions/new' do
  erb(:"transactions/new")
end
