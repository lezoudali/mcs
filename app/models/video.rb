class Video < ActiveRecord::Base
	include SoftDeletable

	belongs_to :mcs_admin

  has_many :comments
  has_many :shares
  has_many :sharers, through: :shares
  has_many :fashion_models_videos
  has_many :fashion_models, through: :fashion_models_videos

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :source_url, presence: true, uniqueness: true
  validates :mcs_admin_id, presence: true

end
