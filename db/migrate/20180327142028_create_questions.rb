class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :correct_option_id, foreign_key :true
      t.integer :total_marks
      t.belongs_to :paper, index :true, foreign_key :true
      t.timestamps
    end
  end
end
