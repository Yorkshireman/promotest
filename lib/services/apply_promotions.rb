require 'promotions/lavender_heart_promotion'
require 'promotions/ten_percent_discount'
require 'promotions/lavender_cinnamon_promotion'

class ApplyPromotions
  @item_promotions =  [LavenderHeartPromotion.new]

  @basket_discounts = [
                        LavenderCinnamonPromotion.new,
                        TenPercentDiscount.new
                      ]

  def self.call total, basket
    total = apply_item_promotions total, basket
    total = apply_basket_discounts total, basket
  end

  
  private

  def self.apply_item_promotions total, basket
    @item_promotions.each do |promotion|
      @total = promotion.apply total, basket
    end
    @total
  end

  def self.apply_basket_discounts total, basket
    @total = total
    @basket_discounts.each do |basket_discount|
      @total = basket_discount.apply @total, basket
    end
    @total.round(2)
  end
end