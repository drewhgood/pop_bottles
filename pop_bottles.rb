
class Recycling

  attr_reader :investment
  

  def initialize(investment)
    @investment = investment
  end


  def pop_purchased
    full_bottles = @investment / 2
  end

 




end


p customer1 = Recycling.new(20).pop_purchased

