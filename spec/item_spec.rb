require 'item'

describe 'Item' do
	it 'has a product code' do
		lavender_heart = Item.new(001)
		expect(lavender_heart.product_code).to eq 001
	end

	xit 'has a title'
	xit 'has a price'
end