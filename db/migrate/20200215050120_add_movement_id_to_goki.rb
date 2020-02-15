class AddMovementIdToGoki < ActiveRecord::Migration[5.2]
  def change
    add_column :gokis, :movement1_id, :integer
    add_column :gokis, :movement2_id, :integer
  end
end
