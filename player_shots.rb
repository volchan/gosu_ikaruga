class PlayerShots
  attr_reader :x, :y
  def initialize(player)
    @player = player
    @img_path = File.dirname(__FILE__) + 'media/player_shots.png'
    @img = Gosu::Image.new(@img_path)
    @x = @player.x + @player.width / 2 - @img.width / 2
    @y = @player.y
    @speed = 8.0
  end

end
