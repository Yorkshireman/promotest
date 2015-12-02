require 'checkout'

describe 'Checkout' do
	it 'initializes with promotional rules by default' do
		c = Checkout.new
		expect(c.promotional_rules).to be_a PromotionalRules
	end
end