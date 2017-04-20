require 'gosu'
require 'pry-byebug'
require_relative 'player'
require_relative 'player_shots'
require_relative 'ennemie'

# bla bla
class Game < Gosu::Window
  WIDTH = 480
  HEIGHT = 760
  def initialize
    super WIDTH, HEIGHT
    self.caption = "Gosu Ikaruga"
    # initialize font and background
    @font = Gosu::Font.new(20)
    @background_image = Gosu::Image.new("media/ikaruga.jpg")
    #initialize player
    @player = Player.new(WIDTH, HEIGHT)
    @player_warp_width = WIDTH.fdiv(2) - (@player.width * @player.scale).fdiv(2)
    @player_warp_height = HEIGHT - (@player.height * @player.scale)
    @player.warp(@player_warp_width, @player_warp_height)
    #initialize ennemies
    @ennemie = Ennemie.new(WIDTH, HEIGHT)
    @ennemie_warp_width = WIDTH.fdiv(2) - (@ennemie.width * @ennemie.scale).fdiv(2)
    @ennemie_warp_height = 0 # HEIGHT - (@ennemie.height * @ennemie.scale)
    @ennemie.warp(@ennemie_warp_width, @ennemie_warp_height)
  end
  
  def update
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @player.turn_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @player.turn_right
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_UP
      @player.accelerate
    end
    if Gosu.button_down? Gosu::KB_DOWN or Gosu::button_down? Gosu::GP_DOWN
      @player.reverse
    end
    exit if Gosu.button_down? Gosu::KB_ESCAPE
    @player.new_shot
    @player.fire
    @ennemie.new_shot
    # @ennemie.fire
  end

  def draw
    @player.draw
    @ennemie.draw
    @player.shots.each(&:draw)
    @ennemie.shots.each(&:draw)
    @background_image.draw(-250, 0, 0, 0.9, 0.9)
    @font.draw("fps: #{Gosu::fps}", 10, 10, 0, 1.0, 1.0, Gosu::Color::AQUA)
  end
end

Game.new.show
