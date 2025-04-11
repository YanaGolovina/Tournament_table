require 'csv'
# require 'gruff'
# require 'spreadsheet'    


# # Чтение участников из EXCEL файла
# def read_participants_EXCEL(file_path)
#   participants = []
#   book = Spreadsheet.open(file_path)
#   sheet1 = book.worksheet('Sheet1')
#   sheet1.each do |row|
#     participants << row.split
#   end
#   participants
# end


# Чтение участников из CSV файла
def read_participants_CSV(file_path)
  participants = []
  CSV.foreach(file_path, headers: false) do |row|
    participants << row
  end
  participants
end
