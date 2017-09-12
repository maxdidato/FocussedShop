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

  end
end