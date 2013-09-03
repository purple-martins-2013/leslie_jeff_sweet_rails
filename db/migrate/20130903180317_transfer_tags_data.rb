class TransferTagsData < ActiveRecord::Migration
  def change
    Article.all.each do |article|
      article.newtags.split(", ").each do |tag|
        new_tag = Tag.find_or_create_by(name: tag)
        article.tags << new_tag
        article.save
      end
    end
    remove_column :articles, :newtags, :string
  end
end
