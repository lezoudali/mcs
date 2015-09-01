class CreateVideoLikes < ActiveRecord::Migration
  def change
    create_table :video_likes do |t|
      t.user :references
      t.video :references

      t.timestamps null: false
    end
  end
end
