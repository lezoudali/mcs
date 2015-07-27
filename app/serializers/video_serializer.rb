class VideoSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :source_url, :views, :num_comments,
  :num_shares, :index_num

  has_one :mcs_admin
  has_many :fashion_models

  def mcs_admin
    object.mcs_admin.user if object.mcs_admin
  end

  def fashion_models
    object.fashion_models.map(&:user)
  end
end

#inherit?
