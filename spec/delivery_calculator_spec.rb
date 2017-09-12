require 'spec_helper'
describe FocussedShop::DeliveryCalculator do


  context '.calculate' do
    it 'returns 4.95 if value is under 50' do
      expect(FocussedShop::DeliveryCalculator.calculate(49)).to eq(4.95)
      expect(FocussedShop::DeliveryCalculator.calculate(1)).to eq(4.95)
    end

    it 'returns 2.95 if value is under 90' do
      expect(FocussedShop::DeliveryCalculator.calculate(50)).to eq(2.95)
      expect(FocussedShop::DeliveryCalculator.calculate(89)).to eq(2.95)
    end

    it 'returns 0 if value is over 90' do
      expect(FocussedShop::DeliveryCalculator.calculate(90)).to eq(0)
      expect(FocussedShop::DeliveryCalculator.calculate(190)).to eq(0)
    end
  end


end