class Game < ActiveRecord::Base
  belongs_to :user1, :class_name => 'User'
  belongs_to :user2, :class_name => 'User'
  attr_accessible :points, :score1, :score2
end
