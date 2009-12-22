class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.datetime :published_at
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
