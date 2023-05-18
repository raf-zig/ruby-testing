require_relative '../lib/tic_tac_toe'

describe Game do
  describe "#win?" do
    let(:player) { instance_double(Player, marker: 0) }
    
    subject(:game) { described_class.new }
    
    
    it 'ggg' do
      game.board = %w[0 0 0 4 5 6 7 8 9]
      #allow (player).to receive(:marker).and_return('0') 
      #game.instance_variable_get(:@board)

      expect(game.win?(player)).to eq true
    end
  end
end