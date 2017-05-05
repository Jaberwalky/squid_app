require_relative '../models/account.rb'
require_relative '../models/category.rb'
require_relative '../models/transaction.rb'

require 'pry-byebug'

account1 = Account.new({'name' => 'Natwest Visa Debit', 'balance' => 712.50, 'image' => 'fake/image/filepath'})
account1.save()

category1 = Category.new({'name' => 'Household', 'image' => 'fake/image/path'})
category1.save()

transaction1 = Transaction.new({'name' => 'Cleaning Supplies', 'Amount' => 23.45, 'category_id' => category1.id, 'account_id' => account1.id})
transaction1.save()

binding.pry
nil
