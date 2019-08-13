# frozen_string_literal: true

class Deck
  attr_reader :current_deck

  def initialize
    @base_deck = %w[2 3 4 5 6 7 8 9 10 J Q K A]
    new_deck!
  end

  def lead
    @current_deck.shift(2)
  end

  def next_card
    @current_deck.shift(1)[0]
  end

  private

  def new_deck!
    @current_deck ||= []
    @base_deck.each do |value|
      @current_deck << "#{value}\u{2660}" << "#{value}\u{2665}" << "#{value}\u{2666}" << "#{value}\u{2663}"
    end
    @current_deck.shuffle!
  end
end
