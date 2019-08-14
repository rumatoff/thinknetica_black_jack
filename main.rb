# frozen_string_literal: true

class Main
  include Game

  @dealer_count = 0
  @player_count = 0

  BET = 10
  GAME_MENU = {'1': 'round_without_card',
               '2': 'round_with_card',
               '3': 'open_cards'}.freeze

  def main_menu
    print 'Введите имя: '
    name = gets.chomp
    @player = Player.new(name)
    @dealer = Dealer.new
    @deck = Deck.new
    start
  end

  private

  def start
    @player.bank -= BET
    @dealer.bank -= BET
    @deck.lead.each { |card| @player.hand << card }
    @deck.lead.each { |card| @dealer.hand << card }
    game_menu
  end

  def game_menu
    current_cards
    game_menu_text
    input = gets.chomp.to_sym

    select_game_menu = lambda do
      send GAME_MENU[input]
    end

    GAME_MENU[input] ? select_game_menu.call : input_error
  end
end
