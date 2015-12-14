class PromotionalRules
  def apply_promotions total, basket
    total = apply_lavender_heart_promotion total, basket
    total = apply_ten_percent_discount(total)
    total.round(2)
  end

  def apply_lavender_heart_promotion total, basket
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

  def apply_ten_percent_discount total
    if total > 60.00
      total = total - total/10
    end
    total
  end
end