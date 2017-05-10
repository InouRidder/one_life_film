class RemoveDateWeddingFromRequest < ActiveRecord::Migration[5.0]
  def change
    remove_column :requests, :date_wedding
  end
end
