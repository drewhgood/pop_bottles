
class Recycling

  attr_reader :investment
  

  def initialize(investment)
    @investment = investment
  end


  def pop_purchased
    @investment / 2
  end

  def return_on_caps
    pop_purchased / 4
  end

  def return_on_bottles
    pop_purchased / 2
  end

  def redeem_free_pop
    return_on_bottles + return_on_caps
  end



end

def prompt
  p "How much would you like to spend?"
  response
end



def response
  response = gets.chomp.to_i
  new_customer(response)
end



def new_customer(response)

@customer1 = Recycling.new(response)


end



prompt



