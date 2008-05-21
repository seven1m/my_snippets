class CreateSnippets < ActiveRecord::Migration
  def self.up
    create_table :snippets do |t|
      t.string :name, :limit => 255
      t.text :description
      t.text :code
      t.string :cached_tag_list, :limit => 500
      t.timestamps
    end
  end

  def self.down
    drop_table :snippets
  end
end
