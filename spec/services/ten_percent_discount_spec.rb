require 'spec_helper'
require 'promotions/ten_percent_discount'

describe TenPercentDiscount do
  let(:subject){ TenPercentDiscount.new }

  it 'total is reduced by ten percent when initial total is over 60.00' do
    expect(subject.apply(61.00)).to eq 54.90
  end

  it 'total remains the same when it is 60.00 or less' do
    expect(subject.apply(60.00)).to eq 60.00
    expect(subject.apply(30.00)).to eq 30.00
  end
end