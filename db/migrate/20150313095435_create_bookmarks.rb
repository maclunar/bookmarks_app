class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :name
      t.string :url
      t.references :domain, index: true

      t.timestamps null: false
    end
    add_foreign_key :bookmarks, :domains
  end
end
