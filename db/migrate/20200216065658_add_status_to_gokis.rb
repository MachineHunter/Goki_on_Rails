class AddStatusToGokis < ActiveRecord::Migration[5.2]
  def change
    add_column :gokis, :status, :string
  end
end
