class CategoriesController < ApplicationController

  def index
    @category = Category.find_by(name: params[:name].gsub("_", " "))
  end
end
