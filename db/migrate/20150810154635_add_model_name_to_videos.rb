class AddModelNameToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :model_name, :string
  end
end
