class LavenderHeartPromotion
  def apply total, basket
    if two_or_more_lavender_hearts? basket
      total = discount_lavender_heart_price total, basket
    end
    total
  end


  private

  def discount_lavender_heart_price total, basket
    basket.map { |item| total -= 0.75 if item == 001 }
    total
  end

  def two_or_more_lavender_hearts? basket
    n = 0
    basket.each do |item|
      n += 1 if item == 001
    end
    n >= 2
  end
end