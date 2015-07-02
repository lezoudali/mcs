class FashionModelsVideo < ActiveRecord::Base
  belongs_to :fashion_model
  belongs_to :video

  validates_presence_of :fashion_model_id
  validates_presence_of :video_id
end
