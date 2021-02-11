require_relative "display"
require_relative "player"

class Game

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @player_1 = HumanPlayer.new("white", @display)
    @player_2 = HumanPlayer.new("black", @display)
    @current_player = @player_1
  end

  def start_game
    input_invalid = true
    while input_invalid
      system("clear")
      puts "+======================================+"
      puts "|   Welcome to Academy Chess           |"
      puts "|      -- Henry Pan, Michael Dean --   |"
      puts "+======================================+\n\n"
      puts "- Select game skin:"
      puts "  - \"classic\" for regular chess"
      puts "  - \"animal\" for animal rumble"
      puts "  - \"fantasy\" for humans vs monsters\n\n"
      print "> "

      input = gets.chomp
      case input
      when "c", "a", "f", "classic", "animal", "fantasy"
        skin = input
        input_invalid = false
      else
        puts "\nInvalid skin! Please try again."
        sleep(2)
      end
    end
    sleep(1)
    system("clear")
    play
  end


  def play
    while !@board.checkmate?(@current_player.color)
      notify_players
      @current_player.make_move(@board)
      swap_turn!
    end
    system("clear")
    swap_turn!
    @display.render
    puts "Congratulations, #{@current_player.color}, you win!"
  end

  private
  def notify_players
    puts "-- #{@current_player.color.capitalize}, it's your move! -- "
    puts "Use the arrow keys to select a piece, and press enter to move."
  end

  def swap_turn!
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

end

g = Game.new
g.start_game

# b = Board.new
# d = Display.new(b)
# # while true
# # d.render
# # d.cursor.get_input
# # end
# d.render
# b.move_piece("white", [6,5], [5,5])
# sleep(1)
# d.render
# b.move_piece("black", [1,4], [3,4])
# sleep(1)
# d.render
# b.move_piece("white", [6,6], [4,6])
# sleep(1)
# d.render
# b.move_piece("black", [0,3], [4,7])
# sleep(1)
# d.render

# p "White is in checkmate? #{b.checkmate?("white")}"

# #p "🏰🦄🧙👸👑🧙🦄🏰🗡️ 🗡️ 🗡️ 🗡️ 🗡️ 🗡️ 🗡️ 🗡️"