class AddNewFieldToArticle < ActiveRecord::Migration
def self.up
		add_column :articles, :date_posted, :DateTime;
  end

  def self.down
		remove_column :articles, :date_posted;
  end
end
