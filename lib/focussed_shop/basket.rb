module FocussedShop
  class Basket
    attr_accessor :products,:catalogue

    def initialize catalogue
      @catalogue = catalogue
    end

    def add product_code
      raise "invalid product code" unless FocussedShop::Products::CATALOGUE.collect{|a| a[:code]}.include?(product_code.to_sym)
      @products ||= {}
      occurences = @products.fetch(product_code.to_sym,0)
      @products[product_code.to_sym] = occurences + 1
    end

    def total
     result =  products.inject(0) do |total,product|
        product_code = product[0]
        product_quantity = product[1]
        product_price =FocussedShop::Products::CATALOGUE.find{|p| p[:code]==product_code}[:price]
        total + (product_price * product_quantity)
     end
     result = result + DeliveryCalculator.calculate(result)
      sprintf("%.2f", result).to_f

    end

  end
end