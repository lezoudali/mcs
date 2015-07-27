class AddIndexNumToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :index_num, :integer 
  end
end
