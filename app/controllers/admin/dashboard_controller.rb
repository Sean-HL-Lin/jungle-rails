class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with :name => Rails.configuration.admin[:username], :password => Rails.configuration.admin[:password] 

  def show
    @product = Product.count
    @Category = Category.count

  p @product 
  p @Category
  end
end
