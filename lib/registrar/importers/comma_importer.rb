module Registrar
  class CommaImporter < Importer
    def self.mapping(row)
      {
        first_name:     row[1],
        middle_initial: nil,
        last_name:      row[0],
        campus:         row[2],
        date_of_birth:  row[4],
        favorite_color: row[3]
      }
    end

    def self.delimiter
      ','
    end
  end
end
