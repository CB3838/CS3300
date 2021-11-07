require "rails_helper"

#define an "example" which is basically a test in rspec
RSpec.describe "The math below was wrong but now its fixed!" do

  #the test expects 6*7 to equal 42. Since this is true, the test will pass
  it "should equal 42" do
    expect(6 * 7).to eq(42)
  end
end

RSpec.describe "hello spec" do
    # create a new string (by default it will be empty) and then run a test that
    # expects the string to be empty. This will always pass.
    let(:string) { String.new }
      it "should provide an empty string" do
        expect(string).to eq("")
      end
end