class CreateExhibits < ActiveRecord::Migration[6.1]
  def change
    create_table :exhibits do |t|
      t.string :name
      t.integer :gallery_id
      t.integer :painting_id
      t.timestamps
    end
  end
end
