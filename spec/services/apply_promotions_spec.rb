require 'spec_helper'
require 'services/apply_promotions'

describe ApplyPromotions do
  let(:subject){ ApplyPromotions }

  it 'returns correct total for a basket with only lavender heart promotion applicable' do
    total = subject.call(38.45, [001, 003, 001])

    expect(total).to eq 36.95
  end

  it 'returns correct total for a basket with only 10% discount applicable' do
    expect(subject.call(74.20, [001, 002, 003])).to eq 66.78
  end

  it 'returns correct total for a basket with only 10% discount and lavender heart promotion applicable' do
    expect(subject.call(83.45, [001, 002, 001, 003])).to eq 73.76
  end

  it "returns correct total for a basket when only lavender_heart & lavender_cinnamon_shampoo promotions apply" do
    expect(subject.call(63.71, [001, 001, 001, 004, 004, 004, 004])).to eq 49.17
  end

  it 'returns correct total for a basket when lavender_heart & lavender_cinnamon_shampoo & 10% discount promotions apply' do
    expect(subject.call(126.74, [001, 001, 001, 004, 002, 002])).to eq 89.63
  end

  it 'returns correct total when no promotions apply' do
    expect(subject.call(29.20, [001, 003])).to eq 29.20
  end

  it 'returns correct total when no promotions are running' do
    subject.instance_variable_set(:@item_promotions, [])
    subject.instance_variable_set(:@basket_discounts, [])
    expect(subject.call(126.74, [001, 001, 001, 004, 002, 002])).to eq 126.74
  end
end