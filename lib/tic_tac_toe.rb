Num_rows = 3
class Board
    attr_reader :board
    def initialize
      @board = Array.new(Num_rows, 0).map{|el| Array.new(Num_rows, '-')}
    end
    def mark_board(co_ords, mark)
      x, y = co_ords
      while @board[x][y] != '-'
        p "Invalid cell, input another one"
        return false
      end   
      @board[x][y] = mark
      display
      true
    end

    def display
        @board.each{|r| p r}
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

    def has_tied?
        (0...Num_rows).all? do |r|
            (0...Num_rows).all? do |c|
                @board[r][c] != '-'
           end
        end
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
    while !@b.mark_board(co_ords,  @players[@active_player_id].mark)
        co_ords = @players[@active_player_id].prompt_player
    end    
    if @b.has_won?(@players[@active_player_id].mark)
        @players[@active_player_id].announce("You have won!")
        loser_id = @active_player_id^1
        @players[loser_id].announce("You have lost!")
        return
    elsif @b.has_tied?
        @players[@active_player_id].announce("You have tied the game!")
        @players[@active_player_id^1].announce("You have tied the game!")  
        return  
    end
    @active_player_id = @active_player_id^1
    play
   end
   #Adds a random comment

   
end

