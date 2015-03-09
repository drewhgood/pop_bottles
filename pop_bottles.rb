require 'colorize'

@total_free_bottles = 0
@current_bottles = 0
@current_caps = 0
@bottle_redemption_ratio = 2
@cap_redemption_ratio = 4

def initial_purchase(investment)
   @current_bottles = investment / @bottle_redemption_ratio
   @current_caps = @current_bottles
   puts "#{@current_bottles} bottle(s) were purchased with an investment of $#{investment}.".colorize(:magenta)
end

def redeem_with_bottles
  free_bottles = @current_bottles / @bottle_redemption_ratio
  not_returned_bottles = @current_bottles % @bottle_redemption_ratio
  returned_bottles = @current_bottles - not_returned_bottles 

  announce_redemption(free_bottles,'bottles')
  update_current_bottles(free_bottles, returned_bottles)
  update_current_caps(free_bottles)
  update_total_free_bottles(free_bottles)
end

def redeem_with_caps
  free_bottles = @current_caps / @cap_redemption_ratio
  not_returned_caps = @current_caps % @cap_redemption_ratio
  returned_caps = @current_caps - not_returned_caps

  announce_redemption(free_bottles,'caps')
  update_current_bottles(free_bottles)
  update_current_caps(free_bottles, returned_caps)
  update_total_free_bottles(free_bottles)
end

def announce_redemption(free_bottles, redemption_type)
  redemption_type == 'bottles' ? color = 'blue' : color = 'red'
  puts "You recieved #{free_bottles} free bottle(s) from returned #{redemption_type}.".colorize(color.to_sym)
end

def update_current_bottles(free_bottles, returned_bottles = 0)
    @current_bottles += (free_bottles - returned_bottles)
end

def update_current_caps(free_bottles, returned_caps = 0)
    @current_caps += (free_bottles - returned_caps)
end

def update_total_free_bottles(free_bottles)
  @total_free_bottles += free_bottles
end

def alert_quantities
  puts "You have #{@current_bottles} bottle(s) & #{@current_caps} cap(s)."
  puts "You have earned a total of #{@total_free_bottles} free bottles.".colorize(:green)
end

def prompt_for_investment
  p "How much would you like to spend?"
end

def prompt_to_invest_again
  p "Would you like to run another calculation? (Y/N)"
end

def collect_response
  gets.chomp
end

def divider
    puts"#########################################################"
end

def recycle
  investing = true
  while investing
    prompt_for_investment
    investment = collect_response.to_i
    initial_purchase(investment)
    divider
   
    while @current_bottles >= @bottle_redemption_ratio || @current_caps >= @cap_redemption_ratio
      redeem_with_bottles
      redeem_with_caps
      alert_quantities
      divider    
    end

    prompt_to_invest_again
    unless collect_response.downcase == "y"
      investing = false
      puts "Thank you for using our recycling program!".colorize(:yellow)
    end

  end
end

recycle
