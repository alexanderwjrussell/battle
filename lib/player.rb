class Player

  attr_reader :name, :health

  HIT_POINTS = 100

  def initialize(name, health = HIT_POINTS)
    @name = name
    @health = health
  end

  def reduce_health
    @health -= 10
  end

  def fubar?
    health <= 0
  end

end
