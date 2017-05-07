require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/category.rb'

get '/categories/new' do
  @spare_images = ["/images/shirt.png","/images/shirt.png","/images/shirt.png","/images/shirt.png","/images/shirt.png"]
  erb(:"categories/new")
end

post '/categories' do
  category = Category.new(params)
  category.save()
  redirect ('/squid')
end
