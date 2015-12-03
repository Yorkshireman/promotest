class ProductRange
	attr_reader :items

	ITEMS = { 
	001 => ["Lavender Heart", 9.25], 
	002 => ["Personalised cufflinks", 45.00],
	003 => ["Kids T-Shirt", 19.95] 
	}

	def initialize
		@items = ITEMS
	end
end