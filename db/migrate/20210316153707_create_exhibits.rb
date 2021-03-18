class CreateExhibits < ActiveRecord::Migration[6.1]
  def change
    create_table :exhibits do |t|
      t.string :name
      t.integer :room_id
      t.integer :painting_id
      t.timestamps
    end
  end
end
