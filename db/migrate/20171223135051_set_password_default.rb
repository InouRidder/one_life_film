class SetPasswordDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :films, :password, nil
  end
end
