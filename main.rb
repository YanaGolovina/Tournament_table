require_relative 'participants_reader'
require_relative 'pair_creator'
require_relative 'tournament_visualizer'

def main
  file_path = 'participants.csv' # Укажите путь к вашему CSV файлу
  participants = read_participants(file_path)
  pairs = create_pairs(participants)
  visualize_tournament(pairs)

  puts "Сформированные пары:"
  pairs.each do |pair|
    puts "#{pair[0][:name]} (#{pair[0][:city]}) vs #{pair[1][:name]} (#{pair[1][:city]})"
  end
end

main
