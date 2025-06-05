# frozen_string_literal: true

require_relative 'lib/tournament_table/participants_reader'
require_relative 'lib/tournament_table/pair_creator'
require_relative 'lib/tournament_table/tournament_visualizer'

def main
  file_path = './test.csv'
  participants = TournamentTable::ParticipantsReader.read_csv(file_path)
  pairs = TournamentTable::PairCreator.create_pairs(participants)
  TournamentTable::TournamentVisualizer.visualize(pairs)
end

main
