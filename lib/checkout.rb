require_relative './promotional_rules.rb'

class Checkout
	attr_reader :promotional_rules

	def initialize(promotional_rules = PromotionalRules.new)
		@promotional_rules = promotional_rules
	end
end