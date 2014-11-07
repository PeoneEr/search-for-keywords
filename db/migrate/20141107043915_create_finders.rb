class CreateFinders < ActiveRecord::Migration
  def change
    create_table :finders do |t|
      t.boolean :modified
      t.integer :uid, limit: 8
      t.string :content
      t.string :source

      t.timestamps
    end
  end
end
