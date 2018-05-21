require 'csv'

class ProductsController < ApplicationController
  def index
    fetch_products
    if params[:furniture_type].present?
      if params[:furniture_type] == "1"
        @products = @products.select { |p| p.category == "bedroom" }
      end
      if params[:furniture_type] == "2"
        @products = @products.select { |p| p.category == "desks" }
      end
      if params[:furniture_type] == "3" 
        @products = @products.select { |p| p.category == "miscellaneous" }
      end
      if params[:furniture_type] == "4" 
        @products = @products.select { |p| p.category == "seating" }
      end
      if params[:furniture_type] == "5" 
        @products = @products.select { |p| p.category == "storage" }
      end
      if params[:furniture_type] == "6" 
        @products = @products.select { |p| p.category == "tables" }
      end
    else
      fetch_products
      @products = @products.select { |p| p.quantity.to_i > 0 }
      @products = @products.map do |p|
        if p.condition == "good"
          p.price = p.price.to_f + (p.price.to_f * 0.1)
          p.price = "#{p.price} (clearance)"
        elsif p.condition == "average"
          p.price = p.price.to_f + (p.price.to_f * 0.2)
          p.price = "#{p.price} (clearance)"
        else 
          p.price = p.price.to_f
        end
        p
      end
      @products = @products.sort_by(&:category)
    end
  end

  def show
    fetch_products
    @products = @products.find { |p| p.pid == params[:id] }
  end

  def fetch_products
    @products = []
    
    CSV.foreach("faust_inventory.csv", headers: true) do |row|
      product = Product.new
      product.pid = row.to_h["pid"]
      product.item = row.to_h["item"]
      product.description = row.to_h["description"]
      product.price = row.to_h["price"]
      product.condition = row.to_h["condition"]
      product.dimension_w = row.to_h["dimension_w"]
      product.dimension_l = row.to_h["dimension_l"]
      product.dimension_h = row.to_h["dimension_h"]
      product.img_file = row.to_h["img_file"]
      product.quantity= row.to_h["quantity"]
      product.category = row.to_h["category"] 

      @products << product
      end
    end
end
