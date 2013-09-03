require 'spec_helper'

describe ArticlesController do

  before(:each) do
    @category = Category.create(name: "Cool New Category!")
    @tag = Tag.create(name: "New TAGG!")
  end

  describe "articles#index" do

    before(:each) do
      get :index
    end

    it "retrieves all categories" do
      assigns(:categories).should eq [@category]
    end

    it "retrieves all tags" do
      assigns(:tags).should eq [@tag]
    end

  end

  describe "articles#new" do

    it "declares new article object for form_for helper" do
      get :new
      assigns(:article).should be_new_record
    end
  end

  describe "article#create" do

    before(:each) do
      post :create, :article => {:category => 'category', :title => 'Super Title', :description => 'Super duper uper'} 
    end

    it "saves the new article to the database" do
      Article.last.title.should eq "Super Title"
      Article.last.category.name.should eq "category"
      Article.last.description.should eq "Super duper uper"
    end

    it "redirects to the show page for the newly created Article" do
      expect(response).to redirect_to "/categories/category/articles/super-title"
    end
  end

  describe "articles#show" do

    before(:each) do
      @article = Article.create(title: "My Article", category: @category)
      get :show, :category_name => "Cool New Category!", :title => "My Article"
    end

    it "retrieves the article" do
      assigns(:article).should eq @article
    end

    it "renders the article show page" do
      expect(response).to render_template("show")
    end
  end

  describe "articles#redirect" do

    before(:each) do
      @article = Article.create(title: "My Article", category: @category)
      time = Time.now
      get :redirect, :month => time.month, :day => time.day, :year => time.year, :title => "my-article"
    end

    it "redirects to the article" do
      expect(response).to redirect_to "/categories/Cool_New_Category!/articles/my-article"
    end

  end

end
