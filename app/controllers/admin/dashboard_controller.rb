class Admin::DashboardController < ApplicationController
  def show
    @products_num = Product.count
    @catagory_num = Category.count
  end
end
