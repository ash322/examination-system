class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.integer :test_id
      t.string :response
      t.belongs_to :question, index :true
      t.timestamps
    end
  end
end
