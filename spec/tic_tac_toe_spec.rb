require './lib/tic_tac_toe.rb'
describe Board do
  describe "#initialize" do
    it "has 3 rows" do
      b = Board.new
      expect(b.board.length).to eql(3) 
    end
    it "has 3 cells per row" do
      b = Board.new
      expect(b.board[0].length).to eql(3)   
    end
  end 
  
  describe "#mark_board" do
    before(:each) do
      @b = Board.new
      @b.mark_board([1,1], '*')
    end
    it "places the mark in the cell denoted by co_ords" do
      expect(@b.board[1][1]).to eql('*')  
    end 
    it "doesn't impact other cells on the board" do
        expect(@b.board[2][1]).to eql('-')    
    end  
  end

  describe "#has_tied?" do
    before(:each) do
        @b = Board.new
        @b.mark_board([0,0], 'X')
        @b.mark_board([0,1], 'O')
        @b.mark_board([0,2], 'X')

        @b.mark_board([1,0], 'O')
        @b.mark_board([1,1], 'X')
        @b.mark_board([1,2], 'O')

        @b.mark_board([2,0], 'O')
        @b.mark_board([2,1], 'X')
       

    end
    it "returns false if there is at least one unoccupied cell" do
      expect(@b.has_tied?).to eql(false)   
    end
    it "returns true if all the cells are occupied" do
      @b.mark_board([2,2], 'O')
      expect(@b.has_tied?).to eql(true)  
    end 
  end
end