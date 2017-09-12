module FocussedShop
  class Basket
    attr_accessor :products, :catalogue,:offers,:delivery_calculator

    def initialize catalogue,delivery_calculator,offers
      @catalogue = catalogue
      @delivery_calculator = delivery_calculator
      @offers = offers
    end

    def add product_code
      raise "invalid product code" unless FocussedShop::Products::CATALOGUE.collect {|a| a[:code]}.include?(product_code.to_sym)
      @products ||= {}
      occurences = @products.fetch(product_code.to_sym, 0)
      @products[product_code.to_sym] = occurences + 1
    end

    def total
      return 0 unless products
      result = products.inject(0) do |total, product|
        product_code = product[0]
        product_quantity = product[1]
        product_price =FocussedShop::Products::CATALOGUE.find {|p| p[:code]==product_code}[:price]
        total + (product_price * product_quantity) - offers.calculate_discount(product_code: product_code, product_quantity: product_quantity)
      end
      result = result + delivery_calculator.calculate(result)
      sprintf("%.2f", result).to_f
    end

  end
end