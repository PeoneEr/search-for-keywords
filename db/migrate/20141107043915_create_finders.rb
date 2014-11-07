class CreateFinders < ActiveRecord::Migration
  def change
    create_table :finders do |t|
      t.string :title
      t.string :source
      t.boolean :modified

      t.timestamps
    end
  end
end
