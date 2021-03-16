class CreatePaintings < ActiveRecord::Migration[6.1]
  def change
    create_table :paintings do |t|
      t.string :title
      t.string :artist
      t.string :artistBio
      t.string :nationality
      t.string :gender
      t.string :date
      t.string :medium
      t.string :artUrl
      t.string :imageUrl

      t.timestamps
    end
  end
end
