class CreateFashionModelsVideos < ActiveRecord::Migration
  def change
    create_table :fashion_models_videos do |t|
      t.integer :fashion_model_id
      t.integer :video_id

      t.timestamps null: false
    end
  end
end
