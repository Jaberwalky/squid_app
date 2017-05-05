require_relative '../db/sql_runner.rb'

class Transaction

  attr_reader :id
  attr_accessor :name, :amount, :category_id, :account_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @amount = params['amount'].to_f
    @category_id = params['category_id'].to_i
    @account_id = params['account_id'].to_i
  end

end
