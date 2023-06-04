require './lib/tic_tac_toe'

describe Player do
  describe '#initialize' do
    subject(:player) {Player.new('Player_1', 'x')}

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
    subject(:game) {Game.new}
    before do
      game.board = %w[x x x 4 5 6 7 8 9]
    end
    
    it 'x x x 4 5 6 7 8 9' do
      expect(game.win?).to be true
    end

    before do
      game.board = %w[1 2 3 x x x 7 8 9]
    end
    
    it '1 2 3 x x x 7 8 9' do
      expect(game.win?).to be true
    end
  end
end