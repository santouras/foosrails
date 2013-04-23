module GameHelper

  def calculate value

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

  private

  def diff
    @diff = self.score1 - self.score2

    @diff *= -1 if @diff < 0
    @diff
  end
end