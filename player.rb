class Player
  attr_reader :x, :y, :height, :width, :scale, :available_shots, :shots
  def initialize(game_width, game_height)
    @game_width = game_width
    @game_height = game_height
    @gfx_ship = Gosu::Image.new("media/ship1.png")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
    @height = @gfx_ship.height
    @width = @gfx_ship.width
    @speed = 4
    @scale = 1.5
    @shots = []
    @available_shots = 1
  end

  def new_shot
    @shots << PlayerShots.new(self) if @available_shots >= 1
    
  end

  def fire
    @shots.each do |shot|
      shot.move
      @shots.delete(shot) if shot.y <= 0
    end
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
    @x -= @speed unless @x <= 0
  end

  def turn_right
    @x += @speed unless @x + (@width * @scale) >= @game_width
  end

  def accelerate
    @y -= @speed unless @y <= 0
  end

  def reverse
    @y += @speed unless @y + (@height * @scale) >= @game_height
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
    @gfx_ship.draw(@x, @y, 2, @scale, @scale)
  end
end
