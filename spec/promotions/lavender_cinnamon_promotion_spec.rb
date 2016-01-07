require 'spec_helper'
require 'promotions/lavender_cinnamon_promotion'

describe LavenderCinnamonPromotion do
  it "discounts the given total by 20% when basket contains two lavender hearts and one cinnamon shampoo" do
    expect(subject.apply(27.49, [001, 001, 004])).to eq 21.991999999999997
  end

  it "discount the given total by 20% when basket contains three lavender hearts and four cinnamon shampoos" do
    expect(subject.apply(63.71, [001, 001, 001, 004, 004, 004, 004])).to eq 50.968
  end

  it "does not discount the given total by 20% when basket contains one lavender heart and one cinnamon shampoo" do
    expect(subject.apply(18.24, [001, 004])).to eq 18.24 
  end
end