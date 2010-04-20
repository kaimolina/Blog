class RemoveSingleAccess < ActiveRecord::Migration
  def self.up
		remove_column :authors , :single_access
		add_column :authors, :single_access_token, :string, :null => false
  end

  def self.down
  	add_column :authors, :single_access, :string
  	remove_column :authors, :single_access_authors
  end
end
