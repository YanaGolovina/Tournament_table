# frozen_string_literal: true

module TournamentTable
  class TournamentVisualizer
    class << self
      def visualize(pairs)
        puts "\n=== Tournament Bracket ===\n\n"
        
        pairs.each_with_index do |pair, index|
          player1, player2 = pair
          round_number = index + 1
          
          # Print round number
          puts "Round #{round_number}:"
          puts "┌─────────────────────────┐"
          
          # Print first player with city
          if player1[0] == "BYE"
            puts "│ BYE                     │"
          else
            puts "│ #{format_player(player1)}#{' ' * (21 - format_player(player1).length)}│"
          end
          
          # Print the VS separator
          puts "│           vs            │"
          
          # Print second player with city
          if player2.nil? || player2[0] == "BYE"
            puts "│ BYE                     │"
          else
            puts "│ #{format_player(player2)}#{' ' * (21 - format_player(player2).length)}│"
          end
          
          puts "└─────────────────────────┘"
          puts "\n" # Add space between matches
        end
      end

      private

      def format_player(player)
        return "BYE" if player.nil? || player[0] == "BYE"
        "#{player[0]} (#{player[1]})"
      end
    end
  end
end 