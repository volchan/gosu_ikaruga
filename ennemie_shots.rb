class EnnemieShots
  attr_reader :x, :y
  def initialize(ennemie)
    @ennemie = ennemie
    @img = Gosu::Image.new("media/ennemie_shots.png")
    @ennemie_width = (@ennemie.width * @ennemie.scale).fdiv(2)
    @img_width = @img.width.fdiv(2)
    @x = @ennemie.x  + ( @ennemie_width - @img_width )
    @y = @ennemie.y
    @speed = 10
  end

  def move
    @y += @speed
  end

  def draw
    @img.draw(@x, @y, 1)
  end

end
