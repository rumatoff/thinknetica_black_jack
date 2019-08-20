# frozen_string_literal: true

class Deck
  attr_reader :cards

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
    Card::SUITS.each do |suit|
      Card::BASE.each do |value|
        @cards << { "#{value}": suit }
      end
    end
    @cards.shuffle!
  end
end
