require_relative './product_range.rb'

class Item
	attr_reader :product_code, :title

	def initialize product_code, product_range=ProductRange.new
		@product_code = product_code
		@title = product_range.items[product_code][0]
	end
end