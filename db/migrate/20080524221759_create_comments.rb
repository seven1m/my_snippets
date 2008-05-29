class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :snippet_id
      t.text :body
      t.string :owner_url
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
