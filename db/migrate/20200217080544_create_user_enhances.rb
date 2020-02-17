class CreateUserEnhances < ActiveRecord::Migration[5.2]
  def change
    create_table :user_enhances do |t|
      t.integer :user_id
      t.integer :enhance_id

      t.timestamps
    end
  end
end
