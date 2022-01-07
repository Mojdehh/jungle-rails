class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with :name => ENV['ADMIN_USERNAME'], :password => ENV['ADMIN_PASSWORD']

  def show
    @category_count = Category.count(:all)
    @product_count = Product.count(:all)
  end
  
end
