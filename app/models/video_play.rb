class VideoPlay < ActiveRecord::Base
  belongs_to :viewer, class_name: "User", foreign_key: :user_id
  belongs_to :watched_video, class_name: "Video", foreign_key: :video_id

  validates_uniqueness_of :user_id, :video_id
end
