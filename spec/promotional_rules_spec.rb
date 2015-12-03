require 'promotional_rules'

describe PromotionalRules do
	describe '#large_enough_total?' do
		it 'returns true when total is over 60' do
			expect(subject.large_enough_total?(61)).to eq true
		end

		it 'returns false when total is 60 or less' do
			expect(subject.large_enough_total?(60)).to eq false
			expect(subject.large_enough_total?(30)).to eq false
		end
	end

	describe '#two_or_more_lavender_hearts?' do
		it 'returns true when there are two or more lavender hearts in the basket' do
			expect(subject.two_or_more_lavender_hearts?([001, 001, 003])).to eq true
		end

		it 'returns false when there are less than two lavender hearts in the basket' do
			expect(subject.two_or_more_lavender_hearts?([001, 002, 002])).to eq false
		end
	end

	describe '#apply_promotions' do
		it 'returns correct total for a basket with no promotion applicable' do
			expect(subject.apply_promotions(54.25, [001, 002])).to eq 54.25
		end

		it 'returns correct total for a basket with only 10% discount applicable' do
			expect(subject.apply_promotions(74.20, [001, 002, 003])).to eq 66.78
		end

		it 'returns correct total for a basket with only lavender heart promotion applicable' do
			expect(subject.apply_promotions(38.45, [001, 003, 001])).to eq 36.95
		end

		it 'returns correct total for a basket with discount and lavender heart promotion applicable' do
			expect(subject.apply_promotions(83.45, [001, 002, 001, 003])).to eq 73.76
		end
	end
end