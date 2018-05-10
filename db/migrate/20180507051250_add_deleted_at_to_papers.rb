class AddDeletedAtToPapers < ActiveRecord::Migration[5.1]
  def change
    add_column :papers, :deleted_at, :datetime
    add_index :papers, :deleted_at
  end
end
