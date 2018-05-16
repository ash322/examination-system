class AddDeletedAtToOptions < ActiveRecord::Migration[5.1]
  def change
    add_column :options, :deleted_at, :datetime
    add_index :options, :deleted_at
  end
end
