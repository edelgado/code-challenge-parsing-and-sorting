require 'registrar/importer'
require 'registrar/importers/comma_importer'
require 'registrar/student'

describe Registrar::CommaImporter do
  context "given a comma-separated file" do
    let(:file) { File.expand_path("../../../../data/comma.txt", __FILE__) }

    it "creates 3 students" do
      students = described_class.import(file_path: file)
      expect(students.size).to eq(3)
    end

    it "assigns the student attributes correctly" do
      students = described_class.import(file_path: file)
      student = students.first
      expect(student.first_name).to eq("Mckayla")
      expect(student.middle_initial).to be_nil
      expect(student.last_name).to eq("Kirlin")
      expect(student.campus).to eq("Atlanta")
      expect(student.date_of_birth).to eq(Date.new(1986,5,29))
      expect(student.favorite_color).to eq("Maroon")
    end
  end
end
