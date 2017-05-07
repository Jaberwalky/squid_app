require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/category.rb'

get '/categories/new' do
  erb(:"categories/new")
end
