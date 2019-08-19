# frozen_string_literal: true

class Main

  def initialize
    @interface = Interface.new
    @player = Player.new(@interface.player_name)
    @dealer = Dealer.new
    @deck = Deck.new
    @game = Game.new(@player, @dealer, @deck, @interface)
    start
  end

  private

  def start
    @player.bank -= Game::BET
    @dealer.bank -= Game::BET
    @deck.lead(@player.hand)
    @deck.lead(@dealer.hand)
    @interface.game_menu(@game)
    repeat
  end

  def repeat
    abort if @dealer.bank.zero? || @player.bank.zero?
    if @interface.repeat?
      @game.clear_hand
      system 'cls'
      start
    else
      abort
    end
  end
end
