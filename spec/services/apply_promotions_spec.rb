require 'spec_helper'
require 'services/apply_promotions'

describe ApplyPromotions do
  let(:subject){ ApplyPromotions }

  it 'returns correct total for a basket with only lavender heart promotion applicable' do
    expect(subject.call(38.45, [001, 003, 001])).to eq 36.95
  end

  it 'returns correct total for a basket when two_or_more_lavender_hearts & lavender_cinnamon_shampoo & 10% discount promotions apply' do
    expect(subject.call(126.74, [001, 001, 001, 004, 002, 002])).to eq 89.63
  end

  it 'returns correct total when no promotions apply' do
    expect(subject.call(29.20, [001, 003])).to eq 29.20
  end
end