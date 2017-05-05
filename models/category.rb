class Category

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @image = params['image']
    @account_id = params['account_id'].to_i
    @transaction_id = params['transaction_id'].to_i
  end



end
