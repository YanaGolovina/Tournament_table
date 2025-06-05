# frozen_string_literal: true

require 'csv'
require 'rubyXL'

module TournamentTable
  class ParticipantsReader
    class << self
      def read_excel(file_path)
        workbook = RubyXL::Parser.parse(file_path)
        worksheet = workbook[0] # Get first worksheet
        participants = []
        
        worksheet.each_with_index do |row, index|
          next if index == 0 # Skip header row
          next if row.nil? || row.cells.all?(&:nil?)
          
          name = row.cells[0]&.value.to_s.strip
          city = row.cells[1]&.value.to_s.strip
          
          participants << [name, city] unless name.empty?
        end
        
        participants
      end

      def read_csv(file_path)
        participants = []
        first_row = true
        
        CSV.foreach(file_path, headers: false) do |row|
          if first_row
            first_row = false
            next
          end
          
          next if row.all?(&:nil?) || row.all?(&:empty?)
          name = row[0].to_s.strip
          city = row[1].to_s.strip
          participants << [name, city] unless name.empty?
        end
        
        participants
      end
    end
  end
end 