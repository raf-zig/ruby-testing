class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  $available_positions  = []

  def player_choose
    loop do
      puts "#{name}, your marker #{marker}, choose the available positions:"
      chosen_position = gets.chomp.to_i
      if !$available_positions.include?(chosen_position) 
        if (1..9).to_a.include? chosen_position
          $available_positions << chosen_position
          return chosen_position
        else
          puts 'Invalid input.'
        end
      else
        puts 'Duplicate input'
      end
    end  
  end
end

class Game 
  WIN_COMBINATIONS = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 5, 9],
    [3, 5, 7],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9]
  ]

  def initialize
    @players = [Player.new('Player_1', 'x'), Player.new('Player_2', '0')]
    @current_player = @players[0]
    @board = %w[1 2 3 4 5 6 7 8 9]
  end

  def play
    puts "\nWelcome to Tic Tac Toe game!"
    print_board
    loop do
      chosen_position = @current_player.player_choose
      @board[chosen_position - 1] = @current_player.marker
      print_board

      if win?(@current_player)
        puts "The winner is #{@current_player.name}!"
        play_again?
      elsif draw?
        puts "It's a draw!"
        play_again?
      end
      switch_player
    end
  end

  def print_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '---------'
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '---------'
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def switch_player
    @current_player = @current_player == @players[0] ? @players[1] : @players[0]
  end

  def win?(player)
    WIN_COMBINATIONS.any? do |arr|
      arr.all? do |i|
        @board[i - 1] == player.marker
      end
    end
  end

  def draw?
    @board.all? { |i| i == 'x' || i == '0' }
  end

  def play_again?
    print 'Play again? y/n:'
    answer = gets.chomp.downcase 
    if answer == 'n'
      exit
    elsif answer == 'y'
      initialize
      $available_positions  = []
      play
    else 
      exit
    end
  end
end

game = Game.new
game.play



