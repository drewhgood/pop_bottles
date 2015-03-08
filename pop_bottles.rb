@current_bottles = 0
@current_caps = 0




def initial_purchase(investment)
   @current_bottles = investment / 2
   @current_caps = @current_bottles
   puts "#{@current_bottles} bottle(s) were purchased with an investment of $#{investment}."
end



def redeem_with_caps
  new_bottles = @current_caps / 4
  @current_bottles += new_bottles
  puts "#{new_bottles} free bottle(s) from caps."
end


def update_caps_count
   remainder = @current_caps % 4
   @current_caps = remainder
   puts "#{@current_caps} cap(s) remaining."
end


def redeem_with_bottles
  new_bottles = @current_bottles/ 2
  @current_bottles += new_bottles
  puts "#{new_bottles} free bottle(s) from bottles."
end


def update_bottles_count
   remainder = @current_bottles % 2
   @current_bottles = remainder
   puts "#{@current_bottles} bottle(s) remaining."
end



def recycle
  happy = true
  initial_purchase(2)
  while happy
  
    redeem_with_caps
    update_caps_count

    redeem_with_bottles
    update_bottles_count

  happy = false
  end

end


recycle










# class Recycling

#   attr_reader :investment,  :caps
  

#   def initialize(investment, caps)
#     @investment = investment
#     @caps = caps
#   end


#   def pop_purchased
#     @investment / 2
#   end

#   def return_on_caps
#     pop_purchased / 4
#   end

#   def return_on_bottles
#     pop_purchased / 2
#   end

#   def redeem_free_pop
#     return_on_bottles + return_on_caps
#   end



# end

# def prompt_for_input(question_number = 0)

#   questions = ["How much would you like to spend?","How many caps do you have?", "How many bottles do you have?"]
#   p questions[question_number]
#   nxt_question = question_number + 1
#   collect_response(nxt_question)
# end



# def collect_response(nxt_question)
  
#   user_response = gets.chomp
#   responses << user_response
#   p responses.length

#   if responses.length < 2

#   prompt_for_input(nxt_question)

#   else

#   create_customer(user_response)
    
#   end
  
# end



# def create_customer(investment)
#   @customer1 = Recycling.new(investment)
#   alert_bottle_quantity(@customer1)
# end


# def alert_bottle_quantity(customer)

#   p "You purchased #{customer.pop_purchased} bottles of pop."
#   p "If recycled, this will generate #{customer.redeem_free_pop} free bottles of pop, #{customer.return_on_caps} from caps, and #{customer.return_on_bottles} from bottles."

#   prompt_for_input

# end

# prompt_for_input



