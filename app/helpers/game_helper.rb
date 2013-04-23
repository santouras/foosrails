module GameHelper

  def calculate

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

  def W user
    return 0.5 if score_diff == 0

    if user == self.user1
      return self.score1 < self.score2 ? 0 : 1
    else
      return self.score1 > self.score2 ? 0 : 1
    end
  end

  private

  def score_diff
    @score_diff = self.score1 - self.score2

    @score_diff *= -1 if @score_diff < 0
    @score_diff
  end
end