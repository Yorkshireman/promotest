require 'checkout'

describe Checkout do
  let(:lavender_heart_double){ double :item, product_code: 001 }

  it 'initializes with promotional rules by default' do
    expect(subject.promotional_rules).to be_a PromotionalRules
  end

  it 'can scan an item' do
    subject.scan(lavender_heart_double)
    expect(subject.basket).to include lavender_heart_double
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