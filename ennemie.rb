class Ennemie
  attr_reader :x, :y, :height, :width, :scale, :available_shots, :shots
  def initialize(game_width, game_height)
    @game_width = game_width
    @game_height = game_height
    @gfx_ship = Gosu::Image.new("media/ship1.png")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @height = @gfx_ship.height
    @width = @gfx_ship.width
    @speed = 4
    @scale = 1.5
    @shots = []
    @available_shots = 1
    @prev_shot_time = 0
  end

  def loading_shots
    @prev_shot_time = Gosu::milliseconds
    EnnemieShots.new(self)
  end

  def shot_elapsed
    Gosu::milliseconds - @prev_shot_time
  end

  def new_shot
    if shot_elapsed > 240
      @shots << loading_shots
    end
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

  def draw
    @gfx_ship.draw(@x, @y, 2, @scale, @scale)
  end
end
