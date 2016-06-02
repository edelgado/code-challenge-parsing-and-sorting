require 'registrar/importer'
require 'registrar/student'

describe Registrar::Importer do
  context "given a comma-separated file" do
    let(:file) { File.expand_path("../../../data/comma.txt", __FILE__) }

    it "shouldn't be used directly" do
      expect {
        described_class.import(file_path: file)
      }.to raise_exception NotImplementedError
    end
  end
end
