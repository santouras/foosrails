module CalculatePoints
  extend ActiveSupport::Concern

  included do
    before_create :calculate
  end

  def calculate
    @points = self.P(self.user1)

    @points *= -1 if @points < 0

    self.points = @points
  end

  def K
    self.weight
  end

  def G
    case score_diff
    when 0, 1
      1
    when 2
      3 / 2.0
    else
      (11 + score_diff ) / 8.0
    end
  end

  def W(user)
    return 0.5 if score_diff == 0

    if user == self.user1
      return self.score1 < self.score2 ? 0 : 1
    else
      return self.score1 > self.score2 ? 0 : 1
    end
  end

  def dr(user)
    user_diff(user)
  end

  def We(user)
    (1 / ( 10 ** ( - self.dr(user) / 400) + 1)).round(3)
  end

  def P(user)
    (self.K * self.G  * ( self.W(user) - self.We(user) )).round(3)
  end

  def score_diff
    @_score_diff ||= calculate_score_diff
  end

  def user_diff(user)
    calculate_user_diff(user)
  end

  def points_for(user)
    if user == self.user1
      return self.score1 < self.score2 ? self.points * -1 : self.points
    else
      return self.score1 > self.score2 ? self.points * -1 : self.points
    end
  end

  private

  def calculate_user_diff(user)
    if user == self.user1
      return self.user1.points - self.user2.points
    else
      return self.user2.points - self.user1.points
    end
  end

  def calculate_score_diff
    @score_diff = self.score1 - self.score2

    @score_diff *= -1 if @score_diff < 0
    @score_diff
  end
end