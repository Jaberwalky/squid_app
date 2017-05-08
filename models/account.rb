require_relative '../db/sql_runner.rb'

class Account

  attr_reader :id
  attr_accessor :name, :balance, :image, :username

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @balance = params['balance'].to_f
    @image = params['image']
    @username = ''
  end

  def formatted_balance
    sprintf("%.2f", @balance)
  end

  def save()
    sql = "INSERT INTO accounts (name, balance, image) VALUES ('#{name}', #{balance}, '#{image}') RETURNING *"
    @id = SqlRunner.run(sql).first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM accounts;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM accounts;"
    SqlRunner.run(sql).map {|account| Account.new(account)}
  end

  def transactions()
    sql = "SELECT * FROM transactions WHERE account_id = #{@id};"
    SqlRunner.run(sql).map {|transaction| Transaction.new(transaction)}
  end

  def update()
    sql = "UPDATE accounts SET name = '#{name}', balance = #{@balance}, image = '#{image}' WHERE id = '#{@id}';"
    SqlRunner.run(sql)
  end

  def add_money(amount)
    @balance += amount
  end

end
