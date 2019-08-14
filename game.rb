# frozen_string_literal: true

module Game
  private

  def current_cards
    player_count
    dealer_count
    puts "Карты дилера: #{@dealer.hand.count}, банк дилера: #{@dealer.bank}"
    puts "Ваши карты: #{@player.hand.join(' ')}, сумма очков: #{@player_count}, ваш банк: #{@player.bank}"
  end

  def dealer_need_card?
    @dealer_count + Score.counter([] << @deck.current_deck.first) < 22
  end

  def dealer_move
    if dealer_need_card?
      puts 'Дилер берет карту'
      @dealer.hand << @deck.next_card
    else
      puts 'Дилер пропускает ход' unless dealer_need_card?
    end
  end

  def open_cards
    dealer_count
    player_count
    puts "Карты дилера: #{@dealer.hand.join(' ')}, сумма очков: #{dealer_count}"
    puts "Ваши карты: #{@player.hand.join(' ')}, сумма очков: #{player_count}"
    result
    repeat
  end

  def result
    if player_win?
      player_win
    elsif draw?
      draw
    else
      dealer_win
    end
  end

  def dealer_count
    @dealer_count = Score.counter(@dealer.hand)
  end

  def player_count
    @player_count = Score.counter(@player.hand)
  end

  def repeat
    abort if @dealer.bank.zero? || @player.bank.zero?
    print 'Повторить ? (y)'
    if gets.chomp == 'y'
      clear_hand
      system 'cls'
      start
    else
      abort
    end
  end

  def player_add_card
    @player.hand << @deck.next_card
  end

  def game_menu_text
    puts '1. Пропустить ход'
    puts '2. Добавить карту'
    puts '3. Открыть карты'
    print 'Ваш выбор: '
  end

  def input_error
    puts 'Повторите ввод'
    game_menu
  end

  def player_win?
    player_count > dealer_count && player_count <= 21 || dealer_count > 21
  end

  def player_win
    @player.bank += self.class::BET * 2
    puts "Вы выйграли! Ваш банк: #{@player.bank}, банк дилера: #{@dealer.bank}"
  end

  def draw?
    player_count == dealer_count
  end

  def draw
    @player.bank += self.class::BET
    @dealer.bank += self.class::BET
    puts 'Ничья'
  end

  def dealer_win
    @dealer.bank += self.class::BET * 2
    puts "Вы проиграли. Ваш банк: #{@player.bank}, банк дилера: #{@dealer.bank}"
  end

  def round_with_card
    player_add_card
    dealer_move
    open_cards
  end

  def round_without_card
    dealer_move
    open_cards
  end

  def clear_hand
    @dealer.hand = []
    @player.hand = []
  end
end
