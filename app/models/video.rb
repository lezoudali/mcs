class Video < ActiveRecord::Base
	include SoftDeletable

	belongs_to :model

	validates :title, presence: true, uniqueness: true
	validates :description, presence: true
	validates :source_url, presence: true, uniqueness: true
	validates :model_id, presence: true

  has_many :video_plays
  has_many :viewers, through: :video_plays
end
