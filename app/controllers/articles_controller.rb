class ArticlesController < ApplicationController

  def index
    @categories = Category.all
    @tags = Tag.all
  end

  def new
    @article = Article.new
  end

  def create
    params[:article][:category_id] = Category.find_or_create_by(name: params[:article][:category]).id
    article = Article.create!(article_params)
    redirect_to "/categories/#{article.category.name.gsub(' ', '_')}/articles/#{article.title.downcase.gsub(' ', '-')}"
  end

  def show
    category_id = Category.find_by(name: params[:category_name].gsub("_", " ")).id
    @article = Article.find_by(category_id: category_id, title: params[:title].gsub("-", " "))
  end

  def redirect
    article = Article.find_by_url("articles/#{params[:month]}/#{params[:day]}/#{params[:year]}/#{params[:title]}")
    redirect_to "/categories/#{article.category.name.gsub(" ", "_")}/articles/#{params[:title]}"
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :category_id)
  end
end
