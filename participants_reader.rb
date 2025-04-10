require 'csv'
require 'gruff'

# Чтение участников из CSV файла
def read_participants(file_path)
  participants = []
  CSV.foreach(file_path, headers: true) do |row|
    participants << { name: row['name'], city: row['city'] }
  end
  participants
end
