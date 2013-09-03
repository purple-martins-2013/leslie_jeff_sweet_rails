class RenameTagsColumn < ActiveRecord::Migration
  def change
    rename_column :articles, :tags, :newtags
  end
end
