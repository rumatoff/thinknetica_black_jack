# frozen_string_literal: true

class Gambler
  include Validation

  attr_reader :name
  attr_accessor :bank

  validate :name, :presence
  validate :bank, :positive

  def initialize(name, bank = 100)
    @name = name
    @bank = bank.to_i
    @hand ||= []
    validate!
  end
end
