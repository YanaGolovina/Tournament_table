require 'csv'

# Чтение участников из CSV файла
def read_participants(file_name)
  participants = []
  CSV.foreach(file_name, headers: false) do |row|
    participants << row
  end
  participants
end

