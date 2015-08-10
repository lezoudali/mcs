class VideoIndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :source_url, :views, :num_comments,
  :num_shares, :index_num, :poster_image_url, :fashion_model_name, :num_likes, :num_purchases


  def num_likes
    rand(8000..10000)
  end

  def num_purchases
    rand(600..800)
  end

  def num_shares
    rand(600..800)
  end
end
