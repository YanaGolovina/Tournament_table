# frozen_string_literal: true

require_relative "tournament_table/version"
require_relative "tournament_table/participants_reader"
require_relative "tournament_table/pair_creator"
require_relative "tournament_table/tournament_visualizer"

module TournamentTable
  class Error < StandardError; end

  def self.create_tournament(file_path)
    participants = if File.extname(file_path).downcase == '.xlsx'
                    ParticipantsReader.read_excel(file_path)
                  else
                    ParticipantsReader.read_csv(file_path)
                  end
    
    pairs = PairCreator.create_pairs(participants)
    TournamentVisualizer.visualize(pairs)
    pairs
  end
end
