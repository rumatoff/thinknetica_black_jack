# frozen_string_literal: true

class Gambler
  attr_reader :name
  attr_accessor :bank

  def initialize(name, bank = 100)
    @name = name
    @bank = bank.to_i
  end
end
