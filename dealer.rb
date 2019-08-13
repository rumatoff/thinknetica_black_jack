# frozen_string_literal: true

class Dealer < Gambler
  validate :bank, :positive

  def initialize(bank = 100)
    @name = 'Dealer'
    @bank = bank.to_i
    @hand ||= []
    validate!
  end
end
