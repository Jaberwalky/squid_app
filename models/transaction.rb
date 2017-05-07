require_relative '../db/sql_runner.rb'
require_relative 'account.rb'
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

  def save()
    sql = "INSERT INTO transactions (name, amount, category_id, account_id) VALUES ('#{name}', #{amount}, #{category_id}, #{account_id}) RETURNING *"
    @id = SqlRunner.run(sql).first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM transactions;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM transactions;"
    SqlRunner.run(sql).map {|transaction| Transaction.new(transaction)}
  end

  def self.total()
    sql = "SELECT SUM(amount) AS total FROM transactions;"
    total = SqlRunner.run(sql).first["total"].to_f
  end

  def update()
    sql = "UPDATE transactions SET name = '#{name}', amount = #{amount}, category_id = #{category_id}, account_id = #{account_id} WHERE id = '#{@id}';"
    SqlRunner.run(sql)
  end

  def category
    sql = "SELECT * FROM categories WHERE id = '#{@category_id}'"
    SqlRunner.run(sql).first
  end

end
