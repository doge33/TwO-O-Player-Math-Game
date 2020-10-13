require './game'
require './player'

player1 = Player.new("Sandy")
player2 = Player.new("Ken")

my_game = Game.new(player1, player2)

my_game.play