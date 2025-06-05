# frozen_string_literal: true

module TournamentTable
  class TournamentVisualizer
    class << self
      BOX_WIDTH = 40  # Total width of the box
      
      def visualize(pairs)
        puts "\n=== Tournament Bracket ===\n\n"
        
        pairs.each_with_index do |pair, index|
          player1, player2 = pair
          round_number = index + 1
          
          # Print round number
          puts "Round #{round_number}:"
          puts "┌" + "─" * BOX_WIDTH + "┐"
          
          # Print first player with city
          if player1[0] == "BYE"
            print_centered("BYE")
          else
            print_centered(format_player(player1))
          end
          
          # Print the VS separator
          print_centered("vs")
          
          # Print second player with city
          if player2.nil? || player2[0] == "BYE"
            print_centered("BYE")
          else
            print_centered(format_player(player2))
          end
          
          puts "└" + "─" * BOX_WIDTH + "┘"
          puts "\n" # Add space between matches
        end
      end

      private

      def format_player(player)
        return "BYE" if player.nil? || player[0] == "BYE"
        "#{player[0]} (#{player[1]})"
      end

      def print_centered(text)
        # Ensure text doesn't exceed box width
        if text.length > BOX_WIDTH - 2
          text = text[0...(BOX_WIDTH - 5)] + "..."
        end
        
        # Calculate padding
        total_padding = BOX_WIDTH - text.length
        left_padding = total_padding / 2
        right_padding = total_padding - left_padding
        
        # Print the line with padding
        puts "│" + " " * left_padding + text + " " * right_padding + "│"
      end
    end
  end
end 