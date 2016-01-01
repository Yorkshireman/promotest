require 'spec_helper'
require 'promotions/lavender_heart_promotion'

describe LavenderHeartPromotion do
  it 'discounts lavender heart price to 8.50 when two or more are in basket' do
    expect(subject.apply(38.45, [001, 003, 001])).to eq 36.95
  end

  it 'does not discount price of lavender heart when less than two are in basket' do
    expect(subject.apply(39.90, [003, 003])).to eq 39.90
    expect(subject.apply(29.20, [001, 003])).to eq 29.20
  end
end