class FashionModel < ActiveRecord::Base
  belongs_to :user
  
  has_many :fashion_models_videos
  has_many :videos, through: :fashion_models_videos
  validates_presence_of :instagram
  validates :user_id, presence: true, uniqueness: true

end

