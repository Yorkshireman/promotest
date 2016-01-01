require_relative './product_range.rb'
require_relative './services/apply_promotions'

class Checkout
  attr_reader :basket, :product_range

  def initialize(product_range = ProductRange)
    @product_range = product_range
    @basket = []
  end

  def scan product_code
    return unless product_range.items.has_key?(product_code)
    basket << product_code
  end

  def total
    total = total_before_promotions basket
    total = ApplyPromotions.call total, basket
    apply_currency_formatting(total)
  end

  private

  def total_before_promotions basket
    total = basket.inject(0){ |sum_total, product_code| sum_total + product_range.items[product_code][:price] }
    total
  end

  def apply_currency_formatting total
    "£" + (sprintf "%.2f", total)
  end
end