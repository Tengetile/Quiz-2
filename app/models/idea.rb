class Idea < ActiveRecord::Base

  belongs_to :user
  
  has_many   :comments, dependent: :destroy
  has_many   :likes, dependent: :destroy
  has_many   :liked_users, through: :likes, source: :users
  
  validates  :title, presence: true
  validates  :description, presence: true

end
