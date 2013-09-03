class ArticlesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
  end

  def create
  end

  def show
    category_id = Category.find_by(name: params[:category_name].gsub("_", " ")).id
    @article = Article.find_by(category_id: category_id, title: params[:title].gsub("-", " "))
  end

  def redirect
    article = Article.find_by_url("articles/#{params[:month]}/#{params[:day]}/#{params[:year]}/#{params[:title]}")
    redirect_to "/categories/#{article.category.name.gsub(" ", "_")}/articles/#{params[:title]}"
  end

end
