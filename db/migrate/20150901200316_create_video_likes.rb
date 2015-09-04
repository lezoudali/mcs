class CreateVideoLikes < ActiveRecord::Migration
  def change
    create_table :video_likes do |t|
      t.references :user, index: true
      t.references :video, index: true

      t.timestamps null: false
    end
    add_foreign_key :video_likes, :users
    add_foreign_key :video_likes, :videos
  end
end
