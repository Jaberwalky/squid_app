require_relative '../models/account.rb'
require_relative '../models/category.rb'
require_relative '../models/transaction.rb'

require 'pry-byebug'

Transaction.delete_all()
Account.delete_all()
Category.delete_all()

account1 = Account.new({'name' => 'Natwest Visa Debit', 'balance' => 712.50, 'image' => '/images/card1.png'})
account1.save()

category1 = Category.new({'name' => 'Fashion', 'image' => '/images/fashion.png'})
category1.save()
category2 = Category.new({'name' => 'Dining', 'image' => '/images/dining.png'})
category2.save()
category3 = Category.new({'name' => 'Coffee', 'image' => '/images/coffee.png'})
category3.save()
category4 = Category.new({'name' => 'Gifts', 'image' => '/images/gift.png'})
category4.save()
category5 = Category.new({'name' => 'Shopping', 'image' => '/images/shopping.png'})
category5.save()


transaction1 = Transaction.new({'name' => 'Cleaning Supplies', 'amount' => 23.45, 'category_id' => category1.id, 'account_id' => account1.id})
transaction1.save()
transaction2 = Transaction.new({'name' => 'Burger with Lucy', 'amount' => 10.50, 'category_id' => category2.id, 'account_id' => account1.id})
transaction2.save()
transaction3 = Transaction.new({'name' => 'Julias Birthday Party', 'amount' => 98.60, 'category_id' => category3.id, 'account_id' => account1.id})
transaction3.save()
# run category.all and show someone what happens!
transaction4 = Transaction.new({'name' => 'Phone Bill', 'amount' => 34.27, 'category_id' => category4.id, 'account_id' => account1.id})
transaction4.save()

binding.pry
nil
