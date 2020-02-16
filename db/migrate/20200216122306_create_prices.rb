class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.text :name
      t.integer :cost

      t.timestamps
    end
  end
end
