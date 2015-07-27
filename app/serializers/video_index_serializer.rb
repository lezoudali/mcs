class VideoIndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :source_url, :views, :num_comments,
  :num_shares, :index_num

end
