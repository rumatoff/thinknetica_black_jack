# frozen_string_literal: true

class Player < Gambler
  validate :name, :presence
  validate :bank, :positive
end
