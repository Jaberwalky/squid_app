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

  def save()
    sql = "INSERT INTO accounts (name, balance, image) VALUES ('#{name}', #{balance}, '#{image}') RETURNING *"
    @id = SqlRunner.run(sql).first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM accounts;"
    SqlRunner.run(sql)
  end

end
