require 'game'

describe Game do

  subject(:game) { described_class.new(player_1,player_2) }
  subject(:game2) { described_class.new(player_1,player_3) }
  let(:player_1) { double :player, name: "Pamela"}
  let(:player_2) { double :player }
  let(:player_3) { double :player, name: "Pikachu" }

  describe '#player_1' do
    it 'retrieves the first player' do
      expect(game.player_1).to eq player_1
    end
  end

  describe '#player_2' do
  context 'player 2 selected' do
    it 'returns player 2' do
      expect(game2.player_2).to eq player_3
    end
  end

  # context 'player 2 not selected' do
  #   it 'returns COMPUTER as the second player' do
  #     expect(game.player_2.name).to eq "COMPUTER"
  #   end
  # end
  end

  describe '#winner' do
    it 'returns a tie if players select the same move' do
      allow(player_1).to receive(:move).and_return("Paper")
      allow(player_2).to receive(:move).and_return("Paper")
      expect(game.winner).to eq "It's a tie"
    end

    context 'player 1 selects Rock' do

      it 'then player 2 selects Paper and wins' do
        allow(player_1).to receive(:move).and_return("Rock")
        allow(player_2).to receive(:move).and_return("Paper")
        expect(game.winner).to eq player_2
      end

      it 'then player 2 selects Scissors and loses' do
        allow(player_1).to receive(:move).and_return("Rock")
        allow(player_2).to receive(:move).and_return("Scissors")
        expect(game.winner).to eq player_1
      end

    end

    context 'player 1 selects Paper' do

      it 'then player 2 selects Scissors and wins' do
        allow(player_1).to receive(:move).and_return("Paper")
        allow(player_2).to receive(:move).and_return("Scissors")
        expect(game.winner).to eq player_2
      end

      it 'then player 2 selects Rock and loses' do
        allow(player_1).to receive(:move).and_return("Paper")
        allow(player_2).to receive(:move).and_return("Rock")
        expect(game.winner).to eq player_1
      end

    end

    context 'player 1 selects Scissors' do

      it 'then player 2 selects Rock and wins' do
        allow(player_1).to receive(:move).and_return("Scissors")
        allow(player_2).to receive(:move).and_return("Rock")
        expect(game.winner).to eq player_2
      end

      it 'then player 2 selects Paper and loses' do
        allow(player_1).to receive(:move).and_return("Scissors")
        allow(player_2).to receive(:move).and_return("Paper")
        expect(game.winner).to eq player_1
      end

    end
  end

end