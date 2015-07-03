class RenameVideoPlayToShare < ActiveRecord::Migration
  def change
    rename_table :video_plays, :shares
  end
end
