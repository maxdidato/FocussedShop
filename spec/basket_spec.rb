require 'spec_helper'
describe FocussedShop::Basket do

  let(:subject){FocussedShop::Basket.new(FocussedShop::Products::CATALOGUE)}
  context '#initialize' do
    it 'is initialised with a catalogue' do
      basket = FocussedShop::Basket.new(FocussedShop::Products::CATALOGUE)
      expect(basket.catalogue).to eq(FocussedShop::Products::CATALOGUE)
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
      expect(subject.products).to eq({S01:2,B01:1})
    end

    it "accepts products code in string or symbols" do
      subject.add("S01")
      subject.add(:S01)
      expect(subject.products).to eq({S01:2})
    end

    it "raises an exception if the product code is not valid" do
      expect{subject.add("Non Existing ")}.to raise_error("invalid product code")
    end
  end

  context "#total" do

    it "returns total amount of the basket" do
      subject.add(:S01)
      subject.add(:S01)
      subject.add(:B01)
      subject.add(:J01)
      expect(subject.total).to eq(("73.8"))
    end
  end
end