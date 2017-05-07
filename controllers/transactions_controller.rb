require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/transaction.rb'
require_relative '../models/category.rb'
require_relative '../models/account.rb'

get '/transactions/new' do
  @categories = Category.all()
  erb(:"transactions/new")
end

# post '/transactions' do
#
# end

post '/transactions/:id/delete' do
  Transaction.delete_at_id(params[:id])
  redirect('/squid')
end
