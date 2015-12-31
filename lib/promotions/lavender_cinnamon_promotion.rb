class LavenderCinnamonPromotion
  def apply total, basket
    if two_or_more_lavender_hearts?(basket) && at_least_one_cinnamon_shampoo?(basket)
      total = twenty_percent_off total
    end
    total
  end

  private

  def twenty_percent_off total
    total -= total/5
  end

  def two_or_more_lavender_hearts? basket
    n = 0
    basket.each do |item|
      n += 1 if item == 001
    end
    n >= 2
  end

  def at_least_one_cinnamon_shampoo? basket
    basket.include? 004
  end
end