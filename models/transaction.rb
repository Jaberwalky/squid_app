class Transaction

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @amount = params['amount'].to_f
    @category_id = params['category_id'].to_i
  end

end
