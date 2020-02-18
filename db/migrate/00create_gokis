class CreateGokis < ActiveRecord::Migration[5.2]
  def change
    create_table :gokis do |t|
      t.text :img
      t.text :name
      t.text :description

		t.references :movement1, foreign_key:{ to_table: :movements }, null: false
		t.references :movement2, foreign_key:{ to_table: :movements }, null: false

      t.timestamps
    end
  end
end
