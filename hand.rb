# frozen_string_literal: true

class Hand
  attr_accessor :cards

  def initialize
    @cards ||= []
  end

  def count
    score ||= 0
    cards.each do |card|
      score += card.points unless card.ace?
      score += 1 if score > 10 && card.ace?
      score += card.points if score <= 10 && card.ace?
    end
    score
  end

  def output(hide = false)
    if hide
      cards = []
      @cards.size.times { cards << '*' }
      cards.join(', ')
    else
      @cards.map(&:to_string).join(', ')
    end
  end
end
