class UpdateColumnBeginTimePlaylines < ActiveRecord::Migration[5.1]
  def change
    change_column :playlines, :begin_time, :string
  end
end
