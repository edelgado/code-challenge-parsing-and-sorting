require 'registrar/importer'
require 'registrar/importers/pipe_importer'
require 'registrar/student'

describe Registrar::PipeImporter do
  context "given a pipe-separated file" do
    let(:file) { File.expand_path("../../../../data/pipe.txt", __FILE__) }
    let(:students) { described_class.import(file_path: file) }

    it "creates 3 students" do
      expect(students.size).to eq(3)
    end

    it "assigns the student attributes correctly" do
      student = students.first
      expect(student.first_name).to eq("Timmothy")
      expect(student.middle_initial).to eq("E")
      expect(student.last_name).to eq("Goyette")
      expect(student.campus).to eq("London")
      expect(student.date_of_birth).to eq(Date.new(1964,10,2))
      expect(student.favorite_color).to eq("Pacific Blue")
    end
  end
end
