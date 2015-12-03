require 'item'

describe 'Item' do
	let(:lavender_heart){ Item.new(001) }

	it 'has a product code' do
		expect(lavender_heart.product_code).to eq 001
	end

	it 'has a title' do
		expect(lavender_heart.title).to eq "Lavender Heart"
	end
end