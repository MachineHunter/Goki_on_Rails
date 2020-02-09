class CreateGokis < ActiveRecord::Migration[5.2]
  def change
    create_table :gokis do |t|
      t.text :img
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
