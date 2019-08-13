# frozen_string_literal: true

class Dealer < Gambler
  def initialize(bank = 100)
    @name = 'Dealer'
    @bank = bank.to_i
  end
end
