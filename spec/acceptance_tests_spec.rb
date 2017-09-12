require 'spec_helper'
describe "acceptance tests" do
  let(:subject) {FocussedShop::Basket.new(FocussedShop::Products::CATALOGUE,
                                          FocussedShop::DeliveryCalculator,
                                          FocussedShop::Offers)}
  it "returns 37.85" do
    subject.add(:S01)
    subject.add(:B01)
    expect(subject.total).to eq(37.85)
  end

  it "returns 54.37" do
    subject.add(:J01)
    subject.add(:J01)
    expect(subject.total).to eq(54.37)
  end

  it "returns 60.85" do
    subject.add(:J01)
    subject.add(:B01)
    expect(subject.total).to eq(60.85)
  end

  it "returns 98.27" do
    subject.add(:S01)
    subject.add(:S01)
    subject.add(:J01)
    subject.add(:J01)
    subject.add(:J01)
    expect(subject.total).to eq(98.27)
  end

end