class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :video

  validates_presence_of :user_id, :video_id
  validates :content, presence: true, length: { in: 1..300 }
end
