class Admin::CategoriesController < ApplicationController
  
  http_basic_authenticate_with :name => Rails.configuration.admin[:username], :password => Rails.configuration.admin[:password] 
  
  def index 
    @categories = Category.all()
  end 

  def create
    @category_name = params[:category][:name]
    @category = Category.new(name: @category_name)
    @category.save
    
    redirect_to [:admin, :categories]
  end 

  def new 
    @category = Category.new
  end

end