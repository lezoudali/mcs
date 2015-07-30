class Video < ActiveRecord::Base
	# include SoftDeletable

	belongs_to :mcs_admin

  has_many :comments, dependent: :destroy
  has_many :shares
  has_many :sharers, through: :shares
  has_many :fashion_models_videos
  has_many :fashion_models, through: :fashion_models_videos

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :source_url, presence: true, uniqueness: true
  validates :mcs_admin_id, presence: true
  validates :index_num, presence: true, uniqueness: true
  validates :poster_image_url, presence: true, uniqueness: true


  def num_comments
    comments.count
  end

  def num_shares
    shares.count
  end

end
#Scope comment