# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'

describe Player do
  describe '#initialize' do
    subject(:player) { Player.new('Player_1', 'x') }

    it 'name method is being created' do
      expect(player.name).to eq('Player_1')
    end

    it 'marker method is being created' do
      expect(player.marker).to eq('x')
    end
  end
end

describe Game do
  describe '#win?' do
    subject(:game) { Game.new }
    context 'when x x x 4 5 6 7 8 9' do
      before do
        game.board = %w[x x x 4 5 6 7 8 9]
      end

      it 'win' do
        expect(game.win?).to be true
      end
    end

    context 'when 0 0 0 4 5 6 7 8 9' do
      before do
        game.board = %w[0 0 0 4 5 6 7 8 9]
        game.change_player
      end

      it 'win' do
        expect(game.win?).to be true
      end
    end

    context 'when 1 2 3 x x x 7 8 9' do
      before do
        game.board = %w[1 2 3 x x x 7 8 9]
      end

      it 'win' do
        expect(game.win?).to be true
      end
    end

    context 'when 1 2 3 4 5 6 x x x' do
      before do
        game.board = %w[1 2 3 4 5 6 x x x]
      end

      it 'win' do
        expect(game.win?).to be true
      end
    end

    context 'when x 2 3 x 5 6 x 8 9' do
      before do
        game.board = %w[x 2 3 x 5 6 x 8 9]
      end

      it 'win' do
        expect(game.win?).to be true
      end
    end

    context 'when 1 x 3 4 x 6 7 x 9' do
      before do
        game.board = %w[1 x 3 4 x 6 7 x 9]
      end

      it 'win' do
        expect(game.win?).to be true
      end
    end

    context 'when 1 2 x 4 5 x 7 8 x' do
      before do
        game.board = %w[1 2 x 4 5 x 7 8 x]
      end

      it 'win' do
        expect(game.win?).to be true
      end
    end

    context 'when x 2 3 4 x 6 7 8 x' do
      before do
        game.board = %w[x 2 3 4 x 6 7 8 x]
      end

      it 'win' do
        expect(game.win?).to be true
      end
    end

    context 'when 1 2 x 4 x 6 x 8 9' do
      before do
        game.board = %w[1 2 x 4 x 6 x 8 9]
      end

      it 'win' do
        expect(game.win?).to be true
      end
    end

    context 'when 1 2 0 4 0 6 0 8 9' do
      before do
        game.board = %w[1 2 0 4 0 6 0 8 9]
        game.change_player
      end

      it 'win' do
        expect(game.win?).to be true
      end
    end

    context 'when 1 2 3 4 5 6 7 8 x' do
      before do
        game.board = %w[1 2 3 4 5 6 7 8 x]
      end

      it 'not win' do
        expect(game.win?).not_to be true
      end
    end

    context 'when x 0 x 0 x x 0 0 0' do
      before do
        game.board = %w[x 0 x 0 x x 0 0 0]
      end

      it 'not win' do
        expect(game.win?).not_to be true
      end
    end

    context 'when 1 2 3 4 5 6 7 8 9' do
      it 'not win' do
        expect(game.win?).not_to be true
      end
    end
  end

  describe '#draw?' do
    subject(:replay_game) { Game.new }
    context 'when game is a draw' do
      before do
        replay_game.board = %w[x 0 x 0 x 0 0 x 0]
      end

      it '"The game is over in a draw" -  message appears' do
        expect(replay_game).to receive(:puts).with('The game is over in a draw')
        expect(replay_game).to receive(:play_again?)
        replay_game.draw?
      end
    end

    context 'when the game is not a draw' do
      before do
        replay_game.board = %w[x 0 x 1 x 0 5 x 0]
      end

      it '"The game is over in a draw" - message does not appear' do
        expect(replay_game).not_to receive(:puts).with('The game is over in a draw')
        expect(replay_game).not_to receive(:play_again?)
        replay_game.draw?
      end
    end
  end

  describe '#play_again?' do
    subject(:new_game) { Game.new }
    it 'user wants to play a new game' do
      expect(new_game).to receive(:print).with('Play again? y/n:')
      allow(new_game).to receive(:gets).and_return('y')
      expect(new_game).to receive(:play)
      new_game.play_again?
    end

    it 'user does not want to play a new game' do
      expect(new_game).to receive(:print).with('Play again? y/n:')
      allow(new_game).to receive(:gets).and_return('n')
      expect(new_game).to receive(:exit)
      new_game.play_again?
    end
  end

  describe '#change_player' do
    subject(:player) { Game.new }
    it 'transition between players' do
      player1 = player.instance_variable_get(:@player_1)
      player2 = player.instance_variable_get(:@player_2)
      expect(player.change_player).to eq(player2)
      expect(player.change_player).to eq(player1)
    end
  end

  describe '#player_choose' do
    subject(:choose) { Game.new }
    context 'when user makes input' do
      it 'it is displayed on the board' do
        valid_input = '3'
        allow(choose).to receive(:checking_input).and_return(valid_input)
        expect(choose.player_choose).to eq(%w[1 2 x 4 5 6 7 8 9])
      end
    end

    context 'when users input is not correct' do
      it 'it is not displayed on the board' do
        input = '0'
        allow(choose).to receive(:checking_input).and_return(input)
        expect(choose.player_choose).to eq(%w[1 2 3 4 5 6 7 8 9])
      end
    end
  end
end
