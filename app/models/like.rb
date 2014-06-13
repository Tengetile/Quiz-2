class Like < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user

  validates :user_id, uniqueness: {scope: :idea_id}, presence: true
end
