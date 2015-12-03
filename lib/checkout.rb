require_relative './promotional_rules.rb'
require_relative './product_range.rb'

class Checkout
	attr_reader :promotional_rules, :basket

	def initialize(promotional_rules = PromotionalRules.new)
		@promotional_rules = promotional_rules
		@basket = []
	end

	def scan product_code
		basket << product_code
	end

	def total
		total = 0
		basket.map{ |item| total += ProductRange.items[item][:price] }
		total = promotional_rules.apply_promotions(total, basket)
		apply_currency_formatting(total)
	end

	def apply_currency_formatting total
		"£" + (sprintf "%.2f", total)
	end
end