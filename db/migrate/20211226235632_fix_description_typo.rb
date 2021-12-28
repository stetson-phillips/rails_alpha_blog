class FixDescriptionTypo < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :articles, :decription, :description
  end
end
