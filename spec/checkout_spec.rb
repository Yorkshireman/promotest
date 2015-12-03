require 'checkout'

describe 'Checkout' do
	let(:co){ Checkout.new }
	let(:lavender_heart_double){ double :item, product_code: 001 }

	it 'initializes with promotional rules by default' do
		expect(co.promotional_rules).to be_a PromotionalRules
	end

	it 'can scan an item' do
		co.scan(lavender_heart_double)
		expect(co.basket).to include lavender_heart_double
	end

	it 'when item is scanned a total can be deduced' do
		co.scan(001)
		expect(co.total).to eq 9.25
	end
end