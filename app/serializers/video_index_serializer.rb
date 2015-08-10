class VideoIndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :source_url, :views, :num_comments,
  :num_shares, :index_num, :poster_image_url, :fashion_model_name
end
