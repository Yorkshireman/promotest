require 'checkout'

describe 'Checkout' do
	let(:co){ Checkout.new }
	let(:lavender_heart_double){ double :item, title: "Lavender Heart", product_code: 001, price: 9.25 }

	it 'initializes with promotional rules by default' do
		expect(co.promotional_rules).to be_a PromotionalRules
	end

	it 'can scan an item' do
		co.scan(lavender_heart_double)
		expect(co.basket).to include lavender_heart_double
	end
end