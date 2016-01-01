require_relative './product_range.rb'
require_relative './services/apply_promotions'

class Checkout
  attr_reader :promotional_rules, :basket

  def initialize
    @basket = []
  end

  def scan product_code
    return unless ProductRange.items.has_key?(product_code)
    basket << product_code
  end

  def total
    total = basket.inject(0){ |sum_total, product_code| sum_total + ProductRange.items[product_code][:price] }
    total = ApplyPromotions.call total, basket
    apply_currency_formatting(total)
  end

  private

  def apply_currency_formatting total
    "£" + (sprintf "%.2f", total)
  end
end