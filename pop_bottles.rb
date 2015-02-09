

class Recycling

  attr_reader :investment,  :caps
  

  def initialize(investment, caps)
    @investment = investment
    @caps = caps
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

def prompt_for_input(question_number = 0)

  questions = ["How much would you like to spend?","How many caps do you have?", "How many bottles do you have?"]
  p questions[question_number]
  nxt_question = question_number + 1
  collect_response(nxt_question)
end



def collect_response(nxt_question)
  
  user_response = gets.chomp
  responses << user_response
  p responses.length

  if responses.length < 2

  prompt_for_input(nxt_question)

  else

  create_customer(user_response)
    
  end
  
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



