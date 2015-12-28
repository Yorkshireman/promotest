class PromotionalRules
  PROMOTIONS = [:lavender_heart_promotion, :ten_percent_discount]

  def apply_promotions total, basket
    @total = total

    if PROMOTIONS.count > 0
      PROMOTIONS.each do |promotion|
        @total = self.send promotion, @total, basket
      end
    end
   
    @total.round(2)
  end

  def lavender_heart_promotion total, basket
    if two_or_more_lavender_hearts? basket
      basket.map { |item| total -= 0.75 if item == 001 }
    end
    total
  end

  def two_or_more_lavender_hearts? basket
    n = 0
    basket.each do |item|
      n += 1 if item == 001
    end
    n >= 2
  end

  def ten_percent_discount total, *arg
    if total > 60.00
      total = total - total/10
    end
    total
  end
end