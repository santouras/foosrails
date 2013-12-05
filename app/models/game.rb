class Game < ActiveRecord::Base
  include CalculatePoints

  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'

  validates :user1_id, presence: true
  validates :user2_id, presence: true
  validates :points, numericality: { greater_than_or_equal_to: 0 }

  after_save do |game|
    [user1, user2].each do |user|
      user.adjust_points(points_for(user))
    end
  end

end
