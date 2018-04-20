class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :questions, :exam, :paper_id
  end
end
