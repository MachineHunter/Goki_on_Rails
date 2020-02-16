class AddMaxScoreToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :max_score, :integer
  end
end
