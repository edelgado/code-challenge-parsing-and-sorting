module Registrar
  class Student
    attr_accessor \
    :first_name,
    :middle_initial,
    :last_name,
    :campus,
    :date_of_birth,
    :favorite_color

    def initialize(first_name:, middle_initial:, last_name:, campus:, date_of_birth:, favorite_color:)
      @first_name       = first_name
      @middle_initial   = middle_initial
      @last_name        = last_name
      @campus           = campus
      @date_of_birth    = date_of_birth
      @favorite_color   = favorite_color
    end

    def campus
      map = {
          "LA"  => "Los Angeles",
          "NYC" => "New York City",
          "SF"  => "San Francisco",
      }
      (map.keys.include? @campus) ? map[@campus] : @campus
    end

    def to_s
      [
        last_name,
        first_name,
        campus,
        date_of_birth.strftime('%-m/%-d/%Y'),
        favorite_color
      ].join(" ")
    end
  end
end
