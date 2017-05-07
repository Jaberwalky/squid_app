require_relative '../db/sql_runner.rb'
require_relative 'transaction.rb'

class Category

  attr_reader :id
  attr_accessor :name, :image

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @image = params['image']
  end

  def self.all()
    sql = "SELECT * FROM categories;"
    SqlRunner.run(sql).map {|category| Category.new(category)}
  end

  def save()
    sql = "INSERT INTO categories (name, image) VALUES ('#{name}', '#{image}') RETURNING *;"
    @id = SqlRunner.run(sql).first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM categories;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM categories;"
    SqlRunner.run(sql).map {|category| Category.new(category)}
  end

  def transactions()
    sql = "SELECT * FROM transactions WHERE category_id = #{@id};"
    SqlRunner.run(sql).map{|transaction| Transaction.new(transaction)}
  end


end
