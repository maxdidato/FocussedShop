require 'spec_helper'
describe FocussedShop::Basket do

  context '#calculate_discount' do
    it 'gets one pairs of jeans free every two' do
      discount = FocussedShop::Offers.calculate_discount(product_code: :J01, product_quantity: 2)
      expect(discount).to eq(16.48)
    end

    it 'discount 1 pair of jeans if the number is 3' do
      discount = FocussedShop::Offers.calculate_discount(product_code: :J01, product_quantity: 3)
      expect(discount).to eq(16.48)
    end

    it 'discount 3 pair of jeans if the number is 7' do
      discount = FocussedShop::Offers.calculate_discount(product_code: :J01, product_quantity: 7)
      expect(discount).to eq(16.48 * 3)
    end

    it "returns 0 if not discount applied" do
      discount = FocussedShop::Offers.calculate_discount(product_code: :S01, product_quantity: 7)
      expect(discount).to eq(0)
    end
  end

end