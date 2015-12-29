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

  describe '#lavender_cinnamon_shampoo_promotion' do
    it "discounts the given total by 20% when basket contains two lavender hearts and one cinnamon shampoo" do
      expect(subject.lavender_cinnamon_shampoo_promotion(27.49, [001, 001, 004])).to eq 21.991999999999997
    end

    it "discount the given total by 20% when basket contains three lavender hearts and four cinnamon shampoos" do
      expect(subject.lavender_cinnamon_shampoo_promotion(63.71, [001, 001, 001, 004, 004, 004, 004])).to eq 50.968
    end
  end

  describe '#cinnamon_shampoo?' do
    it "returns true if the given basket includes at least one cinnamon shampoo" do
      expect(subject.cinnamon_shampoo? [004]).to eq true
      expect(subject.cinnamon_shampoo? [001, 004, 002]).to eq true
    end

    it "returns false if the given basket does not contain any cinnamon shampoos" do
      expect(subject.cinnamon_shampoo? [001, 001, 002]).to eq false
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