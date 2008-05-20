class CreateSnippets < ActiveRecord::Migration
  def self.up
    create_table :snippets do |t|
      t.string :name
      t.text :body
      t.string :tags_string

      t.timestamps
    end
  end

  def self.down
    drop_table :snippets
  end
end
