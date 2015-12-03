require_relative './promotional_rules.rb'

class Checkout
	attr_reader :promotional_rules
	attr_reader :basket

	def initialize(promotional_rules = PromotionalRules.new)
		@promotional_rules = promotional_rules
		@basket = []
	end

	def scan item
		basket << item
	end
end