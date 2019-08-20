# frozen_string_literal: true

class Game
  BET = 10

  def initialize(player, dealer, deck, interface)
    @player = player
    @dealer = dealer
    @deck = deck
    @interface = interface
  end

  def current_cards(hide = true)
    args = {
        dealer_hand: @dealer.hand.output(hide),
        dealer_bank: @dealer.bank,
        player_name: @player.name.capitalize,
        player_hand: @player.hand.output,
        player_count: @player.hand.count,
        player_bank: @player.bank
    }
    @interface.current_card_text(args)
  end

  def clear_hand
    @dealer.hand.cards = []
    @player.hand.cards = []
  end

  private

  def dealer_need_card?
    @dealer.hand.count < 17
  end

  def dealer_move
    if dealer_need_card?
      @interface.dealer_move_text true
      @deck.take_card(@dealer.hand)
    else
      @interface.dealer_move_text unless dealer_need_card?
    end
  end

  def open_cards
    args = {
      dealer_hand: @dealer.hand.output,
      dealer_count: @dealer.hand.count,
      player_name: @player.name.capitalize,
      player_hand: @player.hand.output,
      player_count: @player.hand.count
    }
    @interface.open_cards_text(args)
    result
  end

  def result
    if player_win?
      player_win
    elsif draw?
      draw
    else
      dealer_win
    end
  end

  def player_add_card
    @deck.take_card(@player.hand)
  end

  def player_win?
    player_score = @player.hand.count
    dealer_score = @dealer.hand.count
    player_score > dealer_score && player_score <= 21 || dealer_score > 21
  end

  def player_win
    @player.bank += self.class::BET * 2
    @interface.player_win_text(@player.bank, @dealer.bank)
  end

  def draw?
    @player.hand.count == @dealer.hand.count
  end

  def draw
    @player.bank += self.class::BET
    @dealer.bank += self.class::BET
    @interface.draw_text
  end

  def dealer_win
    @dealer.bank += self.class::BET * 2
    @interface.dealer_win_text(@player.bank, @dealer.bank)
  end

  def round_with_card
    player_add_card
    dealer_move
    open_cards
  end

  def round_without_card
    dealer_move
    open_cards
  end
end
