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
  remaining_bottles = @current_bottles % @bottle_redemption_ratio 

  update_current_bottles(free_bottles, true, remaining_bottles)
  announce_redemption(free_bottles,'bottles')
  update_current_caps(free_bottles, false)
  update_total_free_bottles(free_bottles)
end

def announce_redemption(free_bottles, redemption_type)
  if redemption_type == 'bottles'
    puts "You recieved #{free_bottles} free bottle(s) from returned #{redemption_type}.".colorize(:blue)
  else
    puts "You recieved #{free_bottles} free bottle(s) from returned #{redemption_type}.".colorize(:red)
  end
end

def update_current_bottles(free_bottles, redemption, unredeemed_bottles = 0)
  if redemption
    @current_bottles = (free_bottles + unredeemed_bottles)
  else
    @current_bottles += free_bottles
  end
end

def update_current_caps(free_bottles, redemption, unredeemed_caps = 0)
  if redemption
    @current_caps = (free_bottles + unredeemed_caps)
  else
    @current_caps += free_bottles
  end
end

def redeem_with_caps
  free_bottles = @current_caps / @cap_redemption_ratio
  remaining_caps = @current_caps % @cap_redemption_ratio

  announce_redemption(free_bottles,'caps')
  update_current_bottles(free_bottles, false)
  update_current_caps(free_bottles, true, remaining_caps)
  update_total_free_bottles(free_bottles)
end

def update_total_free_bottles(free_bottles)
  @total_free_bottles += free_bottles
end

def alert_quantities
  puts "You have #{@current_bottles} bottle(s) & #{@current_caps} cap(s)."
  puts "You have earned a total of #{@total_free_bottles} free bottles.".colorize(:green)
end

def recycle
  initial_purchase(100)
  puts"#########################################################"
  while @current_bottles >= @bottle_redemption_ratio || @current_caps >= @cap_redemption_ratio
    redeem_with_bottles
    redeem_with_caps
    alert_quantities
    puts"#########################################################"
  end
end

recycle
