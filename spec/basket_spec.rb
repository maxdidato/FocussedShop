require 'spec_helper'
describe FocussedShop::Basket do

  context '#add' do

    it 'adds an element to the basket' do
      subject.add("S01");
      expect(subject.products).to eq({S01: 1})
    end


  end
end