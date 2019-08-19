# frozen_string_literal: true

class Deck
  attr_reader :cards

  SUITS = %W[\u{2660} \u{2665} \u{2666} \u{2663}].freeze
  BASE = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  def initialize
    new_deck!
  end

  def lead(hand)
    cards = @cards.shift(2)
    cards.each do |card|
      hand.cards << Card.new(card)
    end
  end

  def take_card(hand)
    card = @cards.shift(1)[0]
    hand.cards << Card.new(card)
  end

  private

  def new_deck!
    @cards ||= []
    SUITS.each do |suit|
      BASE.each do |value|
        @cards << {"#{value}": suit}
      end
    end
    @cards.shuffle!
  end
end
