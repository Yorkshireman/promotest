require 'spec_helper'
require 'promotional_rules'

describe PromotionalRules do
  describe '#ten_percent_discount' do
    it 'total is reduced by ten percent when initial total is over 60.00' do
      expect(subject.ten_percent_discount(61.00)).to eq 54.90
    end

    it 'total remains the same when it is 60.00 or less' do
      expect(subject.ten_percent_discount(60.00)).to eq 60.00
      expect(subject.ten_percent_discount(30.00)).to eq 30.00
    end
  end

  describe '#two_or_more_lavender_hearts?' do
    it 'returns true when there are two or more lavender hearts in the basket' do
      expect(subject.two_or_more_lavender_hearts?([001, 001, 003])).to eq true
    end

    it 'returns false when there are less than two lavender hearts in the basket' do
      expect(subject.two_or_more_lavender_hearts?([001, 002, 002])).to eq false
    end
  end

  describe '#apply_promotions' do
    it 'returns correct total for a basket with no promotion applicable' do
      expect(subject.apply_promotions(54.25, [001, 002])).to eq 54.25
    end

    it 'returns correct total for a basket with only 10% discount applicable' do
      expect(subject.apply_promotions(74.20, [001, 002, 003])).to eq 66.78
    end

    it 'returns correct total for a basket with only lavender heart promotion applicable' do
      expect(subject.apply_promotions(38.45, [001, 003, 001])).to eq 36.95
    end

    it 'returns correct total for a basket with discount and lavender heart promotion applicable' do
      expect(subject.apply_promotions(83.45, [001, 002, 001, 003])).to eq 73.76
    end

    it 'returns correct total when no promotions are running' do
      stub_const("PromotionalRules::PROMOTIONS", [])
      expect(subject.apply_promotions(38.45, [001, 003, 001])).to eq 38.45
    end
  end
end