class AddPosterImageUrlToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :poster_image_url, :string
  end
end
