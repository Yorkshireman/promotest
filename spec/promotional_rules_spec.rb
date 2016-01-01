require 'spec_helper'
require 'promotional_rules'

describe PromotionalRules do
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

    it "returns correct total for a basket when two_or_more_lavender_hearts & lavender_cinnamon_shampoo promotions apply" do
      expect(subject.apply_promotions(63.71, [001, 001, 001, 004, 004, 004, 004])).to eq 49.17
    end

    it "returns correct total for a basket when two_or_more_lavender_hearts & lavender_cinnamon_shampoo & 10% discount promotions apply" do
      expect(subject.apply_promotions(126.74, [001, 001, 001, 004, 002, 002])).to eq 89.63
    end

    it 'returns correct total when no promotions are running' do
      stub_const("PromotionalRules::PROMOTIONS", [])
      expect(subject.apply_promotions(38.45, [001, 003, 001])).to eq 38.45
    end
  end
end