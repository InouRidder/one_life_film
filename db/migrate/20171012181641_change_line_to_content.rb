class ChangeLineToContent < ActiveRecord::Migration[5.1]
  def change
    rename_column :form_lines, :line, :content
  end
end
