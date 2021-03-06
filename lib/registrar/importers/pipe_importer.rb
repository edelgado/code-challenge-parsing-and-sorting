module Registrar
  class PipeImporter < Importer
    def self.mapping(row)
      {
        first_name:     row[1],
        middle_initial: row[2],
        last_name:      row[0],
        campus:         row[3],
        date_of_birth:  row[5],
        favorite_color: row[4]
      }
    end

    def self.delimiter
      '|'
    end
  end
end
