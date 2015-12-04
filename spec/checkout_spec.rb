require 'checkout'

describe Checkout do
  it 'initializes with promotional rules by default' do
    expect(subject.promotional_rules).to be_a PromotionalRules
  end

  it 'can scan an item' do
    subject.scan(001)
    expect(subject.basket).to include 001
  end

  it 'cannot scan an item that does not exist in product range' do
    expect{subject.scan(006)}.to_not change{subject.basket.count}
  end

  context 'when no promotional rules apply' do
    it 'when one item is scanned a total can be deduced' do
      subject.scan(002)
      expect(subject.total).to eq "£45.00"
    end

    it 'after multiple items are scanned, a total can be deduced' do
      subject.scan(001)
      subject.scan(003)
      expect(subject.total).to eq "£29.20"
    end
  end

  context 'when one or more promotions apply' do
    it '10% discount is applied when total is more than 60.00' do
      subject.scan(002)
      subject.scan(002)
      expect(subject.total).to eq "£81.00"
    end

    it '0.75 is deducted from total for each lavender heart if two or more are in basket' do
      subject.scan(001)
      subject.scan(002)
      subject.scan(001)
      expect(subject.total).to eq "£55.80"
    end
  end
end