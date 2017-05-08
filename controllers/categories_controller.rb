require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/category.rb'

get '/categories/new' do
  @spare_images = ["/images/shirt.png","/images/shirt.png","/images/shirt.png","/images/shirt.png","/images/shirt.png"]
  erb(:"categories/new")
end

get '/categories' do

end

post '/categories' do
  category = Category.new(params)
  category.save()
  redirect ('/squid')
end

get '/categories/:id' do
  @categories = Category.all()
  @category = Category.find(params[:id])
  @transactions = @category.transactions()
  erb(:'categories/show')
end
