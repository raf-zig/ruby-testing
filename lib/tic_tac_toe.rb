# frozen_string_literal: true

class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def make_move
    @player_choose = gets.chomp.to_s
  end
end

class Game
  attr_accessor :board # I wrote this method for conducting tests

  def initialize
    @board = %w[1 2 3 4 5 6 7 8 9]
    @player_1 = Player.new('Player_1', 'x')
    @player_2 = Player.new('Player_2', '0')
    @current_player = @player_1
  end

  def player_choose
    number = checking_input
    @board.each do |i|
      @board[i.to_i - 1] = @current_player.marker if i == number
    end
  end

  def checking_input
    loop do
      number = @current_player.make_move
      return number if @board.include? number

      puts 'Invalid input.'
    end
  end

  def win?
    if @board[0..2].all? { |i| i == @current_player.marker } ||
       @board[3..5].all? { |i| i == @current_player.marker } ||
       @board[6..8].all? { |i| i == @current_player.marker } ||
       (@board[0] + @board[3] + @board[6]).split('').all? { |i| i == @current_player.marker } ||
       (@board[1] + @board[4] + @board[7]).split('').all? { |i| i == @current_player.marker } ||
       (@board[2] + @board[5] + @board[8]).split('').all? { |i| i == @current_player.marker } ||
       (@board[0] + @board[4] + @board[8]).split('').all? { |i| i == @current_player.marker } ||
       (@board[2] + @board[4] + @board[6]).split('').all? { |i| i == @current_player.marker }
      true
    end
  end

  def draw?
    return unless @board.all? { |i| %w[x 0].include?(i) }

    puts 'The game is over in a draw'
    play_again?
  end

  def play_again?
    print 'Play again? y/n:'
    answer = gets.chomp.downcase
    if answer == 'y'
      @board = %w[1 2 3 4 5 6 7 8 9]
      @current_player = @player_1
      play
    else
      exit
    end
  end

  def change_player
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
  end

  def print_board
    puts
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '---------'
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '---------'
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts
  end

  def play
    puts "\nWelcome to Tic Tac Toe game!"
    puts 'player_1, your marker - x, player_2, your marker - 0, choose the available positions:'
    print_board
    loop do
      player_choose
      print_board
      if win?
        puts "#{@current_player.name} win!"
        play_again?
      end
      draw?
      change_player
    end
  end
end

# game = Game.new
# game.play
