class PlayerShots
  attr_reader :x, :y
  def initialize(player)
    @player = player
    @img = Gosu::Image.new("media/player_shots.png")
    @player_width = (@player.width * @player.scale).fdiv(2)
    @img_width = @img.width.fdiv(2)
    @x = @player.x  + ( @player_width - @img_width )
    @y = @player.y
    @speed = 10
  end

  def move
    @y -= @speed
  end

  def draw
    @img.draw(@x, @y, 1)
  end

end
