require 'product_range'

describe ProductRange do
  it 'has a range of products' do
    expect(subject.items).to be_a Hash
  end
end