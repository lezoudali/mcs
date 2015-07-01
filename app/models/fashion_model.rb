class FashionModel < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :instagram
  validates :user_id, presence: true, uniqueness: true
end

