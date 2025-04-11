# require_relative 'participants_reader.rb'
# require_relative 'pair_creator.rb'
# require_relative 'tournament_visualizer.rb'
require './participants_reader.rb'
require './pair_creator.rb'
require './tournament_visualizer.rb'

def main
  file_path = './test.csv' # Укажите путь к вашему CSV файлу
  participants = read_participants_CSV(file_path)
  # print(participants)
  pairs = create_pairs(participants)
  # visualize_tournament(pairs)
  # pairs
  print("\nСформированные пары:\n")
  pairs.each do |pair|
    print("#{pair[0][0]} (#{pair[0][1]}) vs #{pair[1][0]} (#{pair[1][1]})\n")
    
  end
end

main
