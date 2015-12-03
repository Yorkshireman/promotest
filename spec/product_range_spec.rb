require 'product_range'

describe 'ProductRange' do
	let(:subject){ ProductRange.new }

	it 'has a range of products' do
		expect(subject.items).to be_a Hash
	end
end