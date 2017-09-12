require 'spec_helper'
describe FocussedShop::Basket do

  let(:subject) {FocussedShop::Basket.new(FocussedShop::Products::CATALOGUE,
                                          FocussedShop::DeliveryCalculator,
                                          FocussedShop::Offers)}
  context '#initialize' do
    it 'is initialised with a catalogue,delivery charges rules and offers' do
      basket = FocussedShop::Basket.new(FocussedShop::Products::CATALOGUE,
                                        FocussedShop::DeliveryCalculator,
                                        FocussedShop::Offers)
      expect(basket.catalogue).to eq(FocussedShop::Products::CATALOGUE)
      expect(basket.offers).to eq(FocussedShop::Offers)
      expect(basket.delivery_calculator).to eq(FocussedShop::DeliveryCalculator)
    end
  end

  context '#add' do

    it 'adds an element to the basket' do
      subject.add(:S01);
      expect(subject.products).to eq({S01: 1})
    end


    it 'increases occurences for an existing product' do
      subject.add(:S01)
      subject.add(:B01)
      subject.add(:S01)
      expect(subject.products).to eq({S01: 2, B01: 1})
    end

    it "accepts products code in string or symbols" do
      subject.add("S01")
      subject.add(:S01)
      expect(subject.products).to eq({S01: 2})
    end

    it "raises an exception if the product code is not valid" do
      expect {subject.add("Non Existing ")}.to raise_error("invalid product code")
    end
  end

  context "#total" do

    it "returns 0 if no products" do
      expect(subject.total).to eq(0)
    end
    it "returns total amount of the basket with delivery cost" do
      subject.add(:S01)
      subject.add(:S01)
      subject.add(:B01)
      subject.add(:J01)
      expect(subject.total).to eq((73.8 + 2.95))
    end

    it "returns total amount of the basket plus delivery cost minus discounts" do
      subject.add(:S01)
      subject.add(:S01)
      subject.add(:B01)
      subject.add(:J01)
      subject.add(:J01)
      expect(subject.total).to eq((90.27))
    end
  end
end