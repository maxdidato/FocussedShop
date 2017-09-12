module FocussedShop
  module Offers

    class << self

      def calculate_discount product_code:, product_quantity:
        discount = 0
        if product_code == :J01
          paid_products = (product_quantity.to_f / 2).ceil
          discounted_products = product_quantity - paid_products
          product_price = FocussedShop::Products::CATALOGUE.find {|p| p[:code]==product_code}[:price]
          discount = (product_price/2).to_f.round(2) * discounted_products
        end
        sprintf("%.2f", discount).to_f
      end

    end

  end
end