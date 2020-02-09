class AddGenreIdToGokis < ActiveRecord::Migration[5.2]
  def change
    add_column :gokis, :genre_id, :integer
  end
end
