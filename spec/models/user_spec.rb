require 'rails_helper'

RSpec.describe User, type: :model do

  context "Validation tests" do

    it "ensure password exists" do 
      user = User.new(email: "xxxxxx@gmail.com")
      expect(user.valid?).to eq(false) # user should be invalid if created w/o password
    end

  end
end