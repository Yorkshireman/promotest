class PromotionalRules
	# def promotions_apply? total, basket
	# 	true if large_enough_total?(total) || two_or_more_lavender_hearts?(basket)
	# end

	def large_enough_total? total
		total > 60.00
	end

	def two_or_more_lavender_hearts? basket
		n = 0
		basket.each do |item|
			n += 1 if item == 001
		end
		n >= 2
	end

	def apply_promotions total, basket
		if two_or_more_lavender_hearts?(basket)
			basket.each do |item|
				total -= 0.75 if item == 001
			end
		end

		total = total - (total/10) if large_enough_total?(total)
		total.round(2)
	end
end