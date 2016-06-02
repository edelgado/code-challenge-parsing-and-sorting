require 'registrar/importer'
require 'registrar/importers/dollar_importer'
require 'registrar/student'

describe Registrar::DollarImporter do
  context "given a dollar-sign separated file" do
    let(:file) { File.expand_path("../../../../data/dollar.txt", __FILE__) }
    let(:students) { described_class.import(file_path: file) }

    it "creates 3 students" do
      expect(students.size).to eq(3)
    end

    it "assigns the student attributes correctly" do
      student = students.first
      expect(student.first_name).to eq("Rhiannon")
      expect(student.middle_initial).to eq("O")
      expect(student.last_name).to eq("Nolan")
      expect(student.campus).to eq("Los Angeles")
      expect(student.date_of_birth).to eq(Date.new(1974,10,4))
      expect(student.favorite_color).to eq("Vivid Tangerine")
    end
  end
end
