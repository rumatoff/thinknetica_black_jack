# frozen_string_literal: true

class Player < Gambler
  validate :name, :presence
  validate :bank, :positive

  def initialize(name, bank = 100)
    @name = name
    @hand = PlayerHand.new
    @bank = bank.to_i
    validate!
  end
end
