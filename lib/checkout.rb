require_relative './promotional_rules.rb'
require_relative './product_range.rb'

class Checkout
	attr_reader :product_range, :promotional_rules, :basket

	def initialize(product_range = ProductRange.new, promotional_rules = PromotionalRules.new)
		@product_range = product_range.items
		@promotional_rules = promotional_rules
		@basket = []
	end

	def scan item
		basket << item
	end

	def total
		@product_range[@basket[0]][1]
	end
end