# frozen_string_literal: true

class Interface

  GAME_MENU = {'1': 'round_without_card',
               '2': 'round_with_card',
               '3': 'open_cards'}.freeze

  def player_name
    print 'Введите имя: '
    gets.chomp
  end

  def game_menu(game)
    game.current_cards
    game_menu_text
    input = gets.chomp.to_sym

    select_game_menu = lambda do
      game.send(GAME_MENU[input])
    end

    GAME_MENU[input] ? select_game_menu.call : input_error(game)
  end

  def game_menu_text
    puts '1. Пропустить ход'
    puts '2. Добавить карту'
    puts '3. Открыть карты'
    print 'Ваш выбор: '
  end

  def repeat?
    print 'Повторить ? (y)'
    gets.chomp == 'y'
  end

  def input_error(game)
    puts 'Повторите ввод'
    game_menu(game)
  end

  def current_card_text(args)
    puts "Карты дилера: #{args[:dealer_hand]}, банк дилера: #{args[:dealer_bank]}"
    puts "Ваши карты, #{args[:player_name]}: #{args[:player_hand]}, сумма очков: #{args[:player_count]}, ваш банк: #{args[:player_bank]}"
  end

  def dealer_move_text(need = false)
    if need
      puts 'Дилер берет карту'
    else
      puts 'Дилер пропускает ход'
    end
  end

  def open_cards_text(args)
    puts "Карты дилера: #{args[:dealer_hand]}, сумма очков: #{args[:dealer_count]}"
    puts "Ваши карты, #{args[:player_name]}: #{args[:player_hand]}, сумма очков: #{args[:player_count]}"
  end

  def player_win_text(player_bank, dealer_bank)
    puts "Вы выйграли! Ваш банк: #{player_bank}, банк дилера: #{dealer_bank}"
  end

  def dealer_win_text(player_bank, dealer_bank)
    puts "Вы проиграли. Ваш банк: #{player_bank}, банк дилера: #{dealer_bank}"
  end

  def draw_text
    puts 'Ничья'
  end
end
