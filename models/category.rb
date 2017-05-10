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

  def delete()
    sql = "DELETE FROM categories WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def transactions()
    sql = "SELECT * FROM transactions WHERE category_id = #{@id};"
    SqlRunner.run(sql).map{|transaction| Transaction.new(transaction)}
  end

  def total()
    sql = "SELECT SUM(amount) AS total FROM transactions WHERE category_id = #{@id};"
    total = SqlRunner.run(sql).first["total"].to_f
    # remember to add your display decimal function thingy.
  end

  def self.find(id_to_find)
    sql = "SELECT * FROM categories WHERE id = #{id_to_find}"
    hash = SqlRunner.run(sql).first
    return Category.new(hash)
  end

  def percentage_of_total
    total_by_cat = self.total()
    total = Transaction.total()
    percentage = (total_by_cat / total) * 100
    return percentage.to_i
  end

  def self.delete_at_id(id_to_delete)
    sql = "DELETE FROM categories WHERE id = #{id_to_delete}"
    SqlRunner.run(sql)
  end

end
