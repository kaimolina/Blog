class RenameAuthorsFirstname < ActiveRecord::Migration
  def self.up
  	remove_column :authors, :first_nane
  	add_column :authors, :first_name, :string
  end

  def self.down

  end
end
