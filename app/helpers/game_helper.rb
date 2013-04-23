module GameHelper

  def calculate value

  end

  def K
    self.weight
  end

  def G
    case diff
    when 0, 1
      1
    when 2
      3 / 2.0
    else
      (11 + diff ) / 8.0
    end
  end

  def W user
    return 0.5 if diff == 0

    if user == self.user1
      return self.score1 < self.score2 ? 0 : 1
    else
      return self.score1 > self.score2 ? 0 : 1
    end
  end

  private

  def diff
    @diff = self.score1 - self.score2

    @diff *= -1 if @diff < 0
    @diff
  end
end