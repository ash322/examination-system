class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.integer :user_id
      t.date :start_date
      t.date :end_date
      t.date :test_date
      t.float :marks_obtained
      t.boolean :result
      t.integer :exam_id
      t.timestamps
    end
  end
end
