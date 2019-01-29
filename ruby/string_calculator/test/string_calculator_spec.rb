require 'string_calculator'

RSpec.describe StringCalculator do
  it "returns the 0 when no numbers are passed" do
    expect(StringCalculator.add("")).to eq(0)
  end

  it "returns the number when one number is passed" do
    expect(StringCalculator.add("1")).to eq(1)
  end

  it "returns the total when two comma separated numbers are passed" do
    expect(StringCalculator.add("1,2")).to eq(3)
  end

  it "returns the total when three comma separated numbers are passed" do
    expect(StringCalculator.add("1,2,3")).to eq(6)
  end

  it "returns the total when many comma separated numbers are passed" do
    expect(StringCalculator.add("1,2,3,4,5,6,7,8,9")).to eq(45)
  end

  it "returns the total when values are comma or new line separated" do
    expect(StringCalculator.add("1\n2,3")).to eq(6)
    expect(StringCalculator.add("1,2\n3")).to eq(6)
    expect(StringCalculator.add("1\n2\n3")).to eq(6)
  end

  it "returns the total when a custom delimeter is passed" do
    expect(StringCalculator.add("//;\n1;2;3")).to eq(6)
    expect(StringCalculator.add("//--\n1--2--3")).to eq(6)
  end
end
