require_relative '../db/sql_runner.rb'

class Category

  attr_reader :id
  attr_accessor :name, :image,

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @image = params['image']
  end



end
