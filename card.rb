# frozen_string_literal: true

class Card
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
