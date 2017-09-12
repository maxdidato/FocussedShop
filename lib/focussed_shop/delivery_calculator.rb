module FocussedShop
  class DeliveryCalculator

    class << self
      def calculate price
        return 4.95 if price < 50
        return 2.95 if price < 90
        0 if price >=90
      end
    end
  end
end