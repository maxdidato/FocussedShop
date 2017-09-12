module FocussedShop
  class Basket
    attr_accessor :products
    def add product_code
      @products ||= {}
      occurences = @products.fetch(product_code.to_sym,0)
      @products[product_code.to_sym] = occurences + 1
    end


  end
end