class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end
    create_table :snippets_tags, :id => false do |t|
      t.integer :snippet_id
      t.integer :tag_id
    end
  end

  def self.down
    drop_table :snippets_tags
    drop_table :tags
  end
end
