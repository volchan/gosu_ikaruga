require 'gosu'
require 'pry-byebug'
require_relative 'player'

class Game < Gosu::Window
  WIDTH = 480
  HEIGHT = 760
  def initialize
    super WIDTH, HEIGHT
    self.caption = "Gosu Ikaruga"
    @background_image = Gosu::Image.new("media/ikaruga.jpg")
    # binding.pry
    @player = Player.new(WIDTH, HEIGHT)
    @player.warp( WIDTH.fdiv(2) - (@player.width * 1.5).fdiv(2), HEIGHT - (@player.height * 1.5) )
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
