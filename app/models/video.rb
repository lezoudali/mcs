class Video < ActiveRecord::Base
	include SoftDeletable

	belongs_to :model

	validates :title, presence: true
	validates :description, presence: true
	validates :source_url, presence: true
	validates :model_id, presence: true
end
