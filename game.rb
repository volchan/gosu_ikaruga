require 'gosu'
require 'pry-byebug'
require_relative 'player'
require_relative 'player_shots'

class Game < Gosu::Window
  WIDTH = 480
  HEIGHT = 760
  def initialize
    super WIDTH, HEIGHT
    self.caption = "Gosu Ikaruga"
    @background_image = Gosu::Image.new("media/ikaruga.jpg")
    # binding.pry
    @player = Player.new(WIDTH, HEIGHT)
    @warp_width = WIDTH.fdiv(2) - (@player.width * @player.img_scale).fdiv(2)
    @warp_height = HEIGHT - (@player.height * @player.img_scale)
    @player.warp(@warp_width, @warp_height)
  end

  def update
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @player.turn_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @player.turn_right
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_BUTTON_0
      @player.accelerate
    end
    if Gosu.button_down? Gosu::KB_DOWN or Gosu::button_down? Gosu::GP_DOWN
      @player.reverse
    end
    # @player.move
  end

  def draw
    @player.draw
    @background_image.draw(-250, 0, 0, 0.9, 0.9)
  end
end

Game.new.show
