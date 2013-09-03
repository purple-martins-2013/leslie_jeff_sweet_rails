class TransferCategoriesData < ActiveRecord::Migration
  def change
    add_column :articles, :category_id, :integer
    Article.all.each do |article|
      category = Category.find_or_create_by(name: article.category)
      article.category_id = category.id
      article.save
    end
    remove_column :articles, :category, :string
  end
end
