class CreateSnippets < ActiveRecord::Migration
  def self.up
    create_table :snippets do |t|
      t.string :name, :limit => 255
      t.text :description
      t.text :code
      t.string :cached_tag_list, :limit => 500
      t.string :owner_url
      t.timestamps
    end
    add_index :snippets, :owner_url
  end

  def self.down
    remove_index :snippets, :owner_url
    drop_table :snippets
  end
end
