class CreateDvds < ActiveRecord::Migration
  def change
    create_table :dvds do |t|
      t.string :title
      t.string :genre
      t.integer :release
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
