class Game < ActiveRecord::Base
  include GameHelper

  belongs_to :user1, :class_name => 'User'
  belongs_to :user2, :class_name => 'User'

  validates :user1_id, presence: true
  validates :user2_id, presence: true
  validates :points, :numericality => { :greater_than_or_equal_to => 0 }
end
