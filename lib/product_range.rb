class ProductRange
	ITEMS = { 
	001 => ["Lavender Heart", 9.25], 
	002 => ["Personalised cufflinks", 45.00],
	003 => ["Kids T-Shirt", 19.95] 
	}

	attr_reader :items

	def initialize
		@items = ITEMS
	end
end