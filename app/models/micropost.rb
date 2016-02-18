class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum:140 }
  
  belongs_to :retweet, class_name: "Micropost", foreign_key: "micropost_id"
  has_many :retweets, class_name: "Micropost", foreign_key: "micropost_id" 
  
end
