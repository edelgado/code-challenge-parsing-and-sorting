require 'registrar/student'

describe Registrar::Student do

  subject {
    described_class.new(
        first_name: 'Stephen',
        middle_initial: 'W',
        last_name: 'Hawking',
        campus: 'Cambridge',
        date_of_birth: Date.new(1942, 1, 8),
        favorite_color: 'Black'
    )
  }

  it "has a first name" do
    expect(subject.first_name).to eq('Stephen')
  end

  it "has a middle initial" do
    expect(subject.middle_initial).to eq('W')
  end

  it "has a last name" do
    expect(subject.last_name).to eq('Hawking')
  end

  it "has a campus" do
    expect(subject.campus).to eq('Cambridge')
  end

  it "has a date of birth" do
    expect(subject.date_of_birth).to eq(Date.new(1942, 1, 8))
  end

  it "has a favorite color" do
    expect(subject.favorite_color).to eq('Black')
  end

  it "has a string representation" do
    expect(subject.to_s).to eq("Hawking Stephen Cambridge 1/8/1942 Black")
  end

end
