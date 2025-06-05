# frozen_string_literal: true

module TournamentTable
  class PairCreator
    class << self
      def create_pairs(participants)
        return [] if participants.empty?
        
        # Group participants by city
        city_groups = participants.group_by { |p| p[1] }
        
        # Calculate optimal distribution to maximize city separation
        distributed_participants = distribute_by_city(city_groups)
        
        # If odd number of participants, add a "BYE" player at the end
        if distributed_participants.length.odd?
          distributed_participants << ["BYE", ""]
        end
        
        # Create pairs while avoiding same-city matchups
        create_balanced_pairs(distributed_participants)
      end

      private

      def create_balanced_pairs(participants)
        pairs = []
        remaining = participants.dup
        
        while remaining.length > 1
          player1 = remaining.shift
          
          # Find the best opponent (furthest available player from a different city)
          best_opponent_index = find_best_opponent(player1, remaining)
          player2 = remaining.delete_at(best_opponent_index)
          
          pairs << [player1, player2]
        end
        
        # If there's one player left, pair them with BYE
        if remaining.length == 1
          pairs << [remaining[0], ["BYE", ""]]
        end
        
        pairs
      end

      def find_best_opponent(player, candidates)
        player_city = player[1]
        
        # First try to find an opponent from a different city
        different_city_index = candidates.find_index { |c| c[1] != player_city }
        return different_city_index if different_city_index
        
        # If no different city available, take the furthest available player
        candidates.length - 1
      end

      def distribute_by_city(city_groups)
        # Sort cities by number of participants (descending)
        sorted_cities = city_groups.sort_by { |_, players| -players.length }
        
        # Calculate total number of players
        total_players = sorted_cities.sum { |_, players| players.length }
        distributed = Array.new(total_players)
        
        # First, handle cities with the most participants
        sorted_cities.each do |city, players|
          next if city.empty? # Skip empty city names
          
          # Calculate maximum possible spacing between players from same city
          spacing = (total_players / players.length.to_f).ceil
          
          # Try to place players with maximum spacing
          players.each_with_index do |player, idx|
            # Calculate ideal position with maximum spacing
            ideal_pos = (idx * spacing) % total_players
            # Find the next available position closest to ideal
            position = find_nearest_empty_position(distributed, ideal_pos)
            distributed[position] = player
          end
        end
        
        # Remove any nil entries (shouldn't happen, but just in case)
        distributed.compact
      end

      def find_nearest_empty_position(distributed, ideal_pos)
        length = distributed.length
        offset = 0
        max_attempts = length # Prevent infinite loop
        
        max_attempts.times do
          # Try positions alternating forward and backward from ideal position
          [0, 1, -1].each do |direction|
            pos = (ideal_pos + (direction * offset)) % length
            return pos if distributed[pos].nil?
          end
          offset += 1
        end
        
        # If no position found (shouldn't happen), return the first empty position
        distributed.index(nil) || 0
      end
    end
  end
end 