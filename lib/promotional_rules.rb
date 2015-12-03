class PromotionalRules
	def apply_promotions total, basket
		if two_or_more_lavender_hearts?(basket)
			total = apply_lavender_heart_promotion(total, basket)
		end

		if large_enough_total?(total)
			total = apply_ten_percent_discount(total)
		end

		total.round(2)
	end

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


	private

	def apply_lavender_heart_promotion total, basket
		basket.map { |item| total -= 0.75 if item == 001 }
		total
	end

	def apply_ten_percent_discount total
		total = total - total/10
	end
end