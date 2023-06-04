# frozen_string_literal: true

require './lib/tic_tac_toe'

describe Player do
  describe '#initialize' do
    subject(:player) { Player.new('Player_1', 'x') }

    it 'name' do
      expect(player.name).to eq('Player_1')
    end

    it 'marker' do
      expect(player.marker).to eq('x')
    end
  end
end

describe Game do
  describe '#win?' do
    subject(:game) { Game.new }
    context 'win' do
      before do
        game.board = %w[x x x 4 5 6 7 8 9]
      end

      it 'x x x 4 5 6 7 8 9' do
        expect(game.win?).to be true
      end
    end

    context 'win' do
      before do
        game.board = %w[1 2 3 x x x 7 8 9]
      end

      it '1 2 3 x x x 7 8 9' do
        expect(game.win?).to be true
      end
    end

    context 'win' do
      before do
        game.board = %w[1 2 3 4 5 6 x x x]
      end

      it '1 2 3 4 5 6 x x x' do
        expect(game.win?).to be true
      end
    end

    context 'win' do
      before do
        game.board = %w[x 2 3 x 5 6 x 8 9]
      end

      it 'x 2 3 x 5 6 x 8 9' do
        expect(game.win?).to be true
      end
    end

    context 'win' do
      before do
        game.board = %w[1 x 3 4 x 6 7 x 9]
      end

      it '1 x 3 4 x 6 7 x 9' do
        expect(game.win?).to be true
      end
    end

    context 'win' do
      before do
        game.board = %w[1 2 x 4 5 x 7 8 x]
      end

      it '1 2 x 4 5 x 7 8 x' do
        expect(game.win?).to be true
      end
    end

    context 'win' do
      before do
        game.board = %w[x 2 3 4 x 6 7 8 x]
      end

      it 'x 2 3 4 x 6 7 8 x' do
        expect(game.win?).to be true
      end
    end

    context 'win' do
      before do
        game.board = %w[1 2 x 4 x 6 x 8 9]
      end

      it '1 2 x 4 x 6 x 8 9' do
        expect(game.win?).to be true
      end
    end

    context 'not win' do
      before do
        game.board = %w[1 2 3 4 5 6 7 8 x]
      end
      it '1 2 3 4 5 6 7 8 x' do
        expect(game.win?).not_to be true
      end
    end

    context 'not win' do
      it '1 2 3 4 5 6 7 8 9' do
        expect(game.win?).not_to be true
      end
    end
  end
end
