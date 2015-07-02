class Share < ActiveRecord::Base
    
  belongs_to :sharer, class_name: "User", foreign_key: :user_id
  belongs_to :shared_video, class_name: "Video", foreign_key: :video_id

  validates_presence_of :user_id, :video_id
end
