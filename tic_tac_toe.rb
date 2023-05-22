class Board
    def initialize
      @board = Array.new(3, 0).map{|el| Array.new(3, '-')}
    end
    def mark_board(co_ords, mark)
      x, y = co_ords
      while @board[x][y] != '-'
        p "Invalid cell, input another one"
        x, y = prompt_player
      end   
      @board[x][y] = mark
    end

    def has_won?(mark)
      #check rows
      return true if @board.any?{ |row|  row.all?{|el| el == mark}}
   
      #check cols
      return true if (0...3).any?{|col| @board[0][col]== mark && @board[1][col]== mark && @board[2][col]== mark}
   
      #check front diag
      return true if (0...3).all?{|r| @board[r][r] == mark}
        
      #check reverse diag
      return true if (0...3).all?{|r| @board[r][2 - r] == mark}
        
      false
    end
end
Marks = ['X', 'O']
class Player
    attr_reader :mark
    def initialize
      
      p "Enter player name"
      @name = gets.chomp
      p "Enter a single character to be your mark"
      @mark = gets.chomp
    end
    
    def prompt_player
        p "Enter Row"
        row = gets.chomp.to_i
        p "Enter Column"
        col = gets.chomp.to_i
        [row, col]
    end
    
    def announce(msg)
        p "Hey #{@name}! #{msg}"
    end 
end
Num_of_players = 2
class TicTacToe
   def initialize
     @b = Board.new
     @players = Array.new(Num_of_players, 0).map{|el|  Player.new}
     @active_player_id = 0 
     play
   end
 

   def play
    co_ords = @players[@active_player_id].prompt_player
    @b.mark_board(co_ords,  @players[@active_player_id].mark)
    if @b.has_won?(@players[@active_player_id].mark)
        @players[@active_player_id].announce("You have won!")
        loser_id = @active_player_id^1
        @players[loser_id].announce("You have lost!")
        return
    end
    @active_player_id = @active_player_id^1
    play
   end


   
end

tt = TicTacToe.new();