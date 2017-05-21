class AddDateWeddingAsDateToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :date_wedding, :date
  end
end
