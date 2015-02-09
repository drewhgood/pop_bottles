
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
  collect_response
end



def collect_response
  user_response = gets.chomp.to_i
  create_customer(user_response)
end



def create_customer(investment)
  @customer1 = Recycling.new(investment)
  alert_bottle_quantity(@customer1)
end


def alert_bottle_quantity(customer)

  p "You purchased #{customer.pop_purchased} bottles of pop."
  p "If recycled, this will generate #{customer.redeem_free_pop} free bottles of pop, #{customer.return_on_caps} from caps, and #{customer.return_on_bottles} from bottles."

  prompt_for_input

end





prompt_for_input


