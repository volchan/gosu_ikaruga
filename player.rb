class Player
  def initialize
    @image = Gosu::Image.new("media/ship1.png")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
    @x <= 0 ? @x : @x -= 4
  end

  def turn_right
    @x >= 391.5 ? @x : @x += 4
  end

  def accelerate
    @y <= 0 ? @y : @y -= 4
  end

  def reverse
    @y >= 689.5 ? @y : @y += 4
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 480
    @y %= 760

    @vel_x *= 0.90
    @vel_y *= 0.90
  end

  def draw
    @image.draw(@x, @y, 1, 1.5, 1.5)
  end
end
