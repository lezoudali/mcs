class CreateVideoPlays < ActiveRecord::Migration
  def change
    create_table :video_plays do |t|
      t.integer :video_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
