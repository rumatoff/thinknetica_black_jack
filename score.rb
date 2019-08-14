# frozen_string_literal: true

module Score
  def self.counter(hand)
    score ||= 0
    hand.each do |card|
      score += card.to_i unless card.to_i.zero?
      score += 10 if card.to_i.zero?
      score += 1 if score >= 10 && ace?(card)
      score += 11 if score <= 10 && ace?(card)
    end
    score
  end

  def self.ace?(card)
    card[0].to_sym == :A
  end
end
