class Account

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @balance = params['balance'].to_f
    @image = params['image']
    @username = ''
  end


end
