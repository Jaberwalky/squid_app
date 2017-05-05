require_relative '../models/account.rb'
require_relative '../models/category.rb'
require_relative '../models/transaction.rb'

require 'pry-byebug'

Transaction.delete_all()
Account.delete_all()
Category.delete_all()

account1 = Account.new({'name' => 'Natwest Visa Debit', 'balance' => 712.50, 'image' => 'fake/image/filepath'})
account1.save()

category1 = Category.new({'name' => 'Household', 'image' => 'fake/image/path'})
category1.save()

transaction1 = Transaction.new({'name' => 'Cleaning Supplies', 'amount' => 23.45, 'category_id' => category1.id, 'account_id' => account1.id})
transaction1.save()
transaction2 = Transaction.new({'name' => 'Food', 'amount' => 10.50, 'category_id' => category1.id, 'account_id' => account1.id})
transaction2.save()

binding.pry
nil
