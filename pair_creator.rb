def create_pairs(participants)
  pairs = []
  cities = Hash.new { |hash, key| hash[key] = [] } 

  # Группируем участников по городам
  participants.each do |participant|
    cities[participant[:city]] << participant
  end

  # Создаем пары
  while participants.size > 1
    # Берем первого участника
    participant = participants.shift
    # Ищем пару, которая не из того же города
    pair = participants.find { |p| p[:city] != participant[:city] }
    
    if pair
      pairs << [participant, pair]
      participants.delete(pair)
    else
      # Если нет пары, добавляем обратно
      participants << participant
      break
    end
  end

  pairs
end