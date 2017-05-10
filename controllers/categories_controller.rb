require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/category.rb'

get '/categories/new' do
  @spare_images = ["/images/ring.png","/images/glass.png","/images/label.png","/images/headphones.png","/images/shop.png"]
  erb(:"categories/new")
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

post '/category/:id/delete' do
  category = Category.find(:id)
  category.delete()
  redirect ('/squid')
end
