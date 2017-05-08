require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/account.rb'

get '/balance/:id/edit' do
  @account = Account.find(:id)
  erb(:'balance/update')
end

post '/balance/:id' do
  @account = Account.find(:id)
  @account.add_money(params[:amount_to_add].to_f)
  @account.update()
  redirect ('/squid')
end

get '/accounts/new' do
  @card_images = ['/images/card1.png', '/images/card2.png', '/images/card3.png', '/images/card4.png', '/images/card5.png']
  erb(:'accounts/new')
end

post '/accounts' do
  @account = Account.new(params)
  @account.save()
  redirect ('/squid')
end

post '/accounts/:id/delete' do
  Account.delete_at_id(params[:id])
  redirect('/squid')
end
