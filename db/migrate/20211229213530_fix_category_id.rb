class FixCategoryId < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :article_categories, :category_ids, :category_id
  end
end
