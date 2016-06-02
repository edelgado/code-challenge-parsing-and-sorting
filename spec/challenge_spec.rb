require 'registrar/importer'
require 'registrar/importers/comma_importer'
require 'registrar/importers/dollar_importer'
require 'registrar/importers/pipe_importer'
require 'registrar/student'

describe "The code exercise" do
  context "given three files of student data" do
    let(:comma_file)  { File.expand_path("../../data/comma.txt", __FILE__) }
    let(:dollar_file) { File.expand_path("../../data/dollar.txt", __FILE__) }
    let(:pipe_file)   { File.expand_path("../../data/pipe.txt", __FILE__) }
    let(:students)    { [] }

    before do
      students << Registrar::CommaImporter.import(file_path: comma_file)
      students << Registrar::DollarImporter.import(file_path: dollar_file)
      students << Registrar::PipeImporter.import(file_path: pipe_file)
      students.flatten!
    end

    it "can print students sorted by campus (ascending), then by last_name (ascending)" do
      output = students.sort_by{ |s| [s.campus, s.last_name] }.map(&:to_s).join("\n")

      sorted_students = [
        "Kirlin Mckayla Atlanta 5/29/1986 Maroon",
        "Barrows Anika Hong Kong 5/5/1965 Spring Green",
        "Goyette Timmothy London 10/2/1964 Pacific Blue",
        "Nolan Rhiannon Los Angeles 10/4/1974 Vivid Tangerine",
        "Parker Matteo Melbourne 2/14/1962 Burnt Sienna",
        "Bednar Filomena New York City 1/24/1980 Salmon",
        "Cummerata Elliot New York City 4/3/1947 Neon Carrot",
        "Wilkinson Stacy New York City 1/22/1964 Shocking Pink",
        "Bruen Rigoberto San Francisco 12/1/1962 Raw Umber",
      ].join("\n")

      expect(output).to eq(sorted_students)
    end

    it "can print students sorted by date_of_birth (ascending)" do
      output = students.sort_by{ |s| s.date_of_birth }.map(&:to_s).join("\n")

      sorted_students = [
        "Cummerata Elliot New York City 4/3/1947 Neon Carrot",
        "Parker Matteo Melbourne 2/14/1962 Burnt Sienna",
        "Bruen Rigoberto San Francisco 12/1/1962 Raw Umber",
        "Wilkinson Stacy New York City 1/22/1964 Shocking Pink",
        "Goyette Timmothy London 10/2/1964 Pacific Blue",
        "Barrows Anika Hong Kong 5/5/1965 Spring Green",
        "Nolan Rhiannon Los Angeles 10/4/1974 Vivid Tangerine",
        "Bednar Filomena New York City 1/24/1980 Salmon",
        "Kirlin Mckayla Atlanta 5/29/1986 Maroon",
      ].join("\n")

      expect(output).to eq(sorted_students)
    end

    it "can print students sorted by last_name (descending)" do
      output = students.sort{|a,b| b.last_name <=> a.last_name }.map(&:to_s).join("\n")

      sorted_students = [
        "Wilkinson Stacy New York City 1/22/1964 Shocking Pink",
        "Parker Matteo Melbourne 2/14/1962 Burnt Sienna",
        "Nolan Rhiannon Los Angeles 10/4/1974 Vivid Tangerine",
        "Kirlin Mckayla Atlanta 5/29/1986 Maroon",
        "Goyette Timmothy London 10/2/1964 Pacific Blue",
        "Cummerata Elliot New York City 4/3/1947 Neon Carrot",
        "Bruen Rigoberto San Francisco 12/1/1962 Raw Umber",
        "Bednar Filomena New York City 1/24/1980 Salmon",
        "Barrows Anika Hong Kong 5/5/1965 Spring Green",
      ].join("\n")

      expect(output).to eq(sorted_students)
    end
  end
end
