# frozen_string_literal: true

class Card
  SUITS = %W[\u{2660} \u{2665} \u{2666} \u{2663}].freeze
  BASE = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  attr_accessor :value, :points

  def initialize(arg)
    arg.each do |value, suit|
      @value = value
      @suit = suit
    end
    count_points!
  end

  def to_string
    "#{@value}#{@suit}"
  end

  def ace?
    @value == :A
  end

  private

  def count_points!
    @points ||= 0
    @points += @value.to_s.to_i unless @value.to_s.to_i.zero?
    @points += 10 if @value.to_s.to_i.zero? && !ace?
    @points += 11 if ace?
  end
end
