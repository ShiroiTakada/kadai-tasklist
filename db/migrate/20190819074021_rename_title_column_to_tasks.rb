class RenameTitleColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :title, :status
  end
end
