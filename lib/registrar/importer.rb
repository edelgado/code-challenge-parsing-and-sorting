require 'csv'

module Registrar
  class Importer
    def self.import(file_path:)
      students = []
      CSV.foreach(file_path, col_sep: self.delimiter, converters: [:strip, :custom_date]) do |row|
        map = mapping(row)
        students << Student.new(
          first_name:     map[:first_name],
          middle_initial: map[:middle_initial],
          last_name:      map[:last_name],
          campus:         map[:campus],
          date_of_birth:  map[:date_of_birth],
          favorite_color: map[:favorite_color]
        )
      end
      students
    end

  private

    DATE_PATTERN = %r((?<month>\d+)[-/](?<day>\d+)[-/](?<year>\d+))

    CSV::Converters[:strip] = -> (field) {
      field.strip
    }

    CSV::Converters[:custom_date] = -> (field) {
      date_pieces = DATE_PATTERN.match(field)
      date_pieces.nil? ? field : Date.new(date_pieces[:year].to_i, date_pieces[:month].to_i, date_pieces[:day].to_i)
    }

    def self.mapping(_)
      raise NotImplementedError, "Sub-class responsibility"
    end

    def self.delimiter
      raise NotImplementedError, "Sub-class responsibility"
    end

  end
end
