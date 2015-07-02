class McsAdmin < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user_id
  has_many :videos
end
