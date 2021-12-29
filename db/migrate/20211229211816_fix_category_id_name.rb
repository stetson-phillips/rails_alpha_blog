class FixCategoryIdName < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :article_categories, :category_id, :category_ids
  end
end
