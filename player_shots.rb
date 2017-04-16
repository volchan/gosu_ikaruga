class PlayerShots
  attr_reader :x, :y
  def initialize(player)
    @player = player
    @img = Gosu::Image.new("media/player_shots.png")
    @x_player_width = (@player.width * @player.scale).fdiv(2)
    @x_img_width = (@img.width * @player.scale).fdiv(2)
    @x = @player.x  + ( @x_player_width - @x_img_width )
    @y = @player.y
    @speed = 8.0
  end

  def move
    @y -= @speed
  end

  def draw
    @img.draw(@x, @y, 1)
  end

end
