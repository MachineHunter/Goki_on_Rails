class AddMovement12ToGokis < ActiveRecord::Migration[5.2]
  def change
    add_reference :gokis, :movement1, foreign_key: { to_table: :movements }
    add_reference :gokis, :movement2, foreign_key: { to_table: :movements }
  end
end
