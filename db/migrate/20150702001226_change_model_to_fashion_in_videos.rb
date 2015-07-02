class ChangeModelToFashionInVideos < ActiveRecord::Migration
  def change
    rename_column :videos, :model_id, :fashion_model_id
  end
end
