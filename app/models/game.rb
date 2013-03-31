class Game < ActiveRecord::Base
  attr_accessible :points, :score1, :score2, :user1_id, :user2_id

  belongs_to :user1, :class_name => 'User'
  belongs_to :user2, :class_name => 'User'
end
