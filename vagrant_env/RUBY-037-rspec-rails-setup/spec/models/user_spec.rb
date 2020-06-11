require 'rails_helper'

RSpec.describe User, type: :model do
  context "With valid parameters" do
    it "should save" do
      user = User.new(
        first_name: "shane",
        last_name: "chang",
        email: "schang@codingdojo.com"
      )
      expect(user).to be_valid
    end
  end

  context "With invalid parameters" do
    it "should not save if first_name field is blank" do
      user = User.new(
        first_name: "",
        last_name: "chang",
        email: "schang@codingdojo.com"
      )
      expect(user).to be_invalid
    end
    
    it "should not save if last_name field is blank" do
      user = User.new(
        first_name: "shane",
        last_name: "",
        email: "schang@codingdojo.com"
      )
      expect(user).to be_invalid
    end

    it "should not save if email already exists" do
      user = User.create(
        first_name: "shane",
        last_name: "chang",
        email: "schang@codingdojo.com"
      )
      
      user = User.create(
        first_name: "sergio",
        last_name: "chang",
        email: "schang@codingdojo.com"
      )
      
      expect(user).to be_invalid
    end
    
    it "should not save if invalid email format" do
      user = User.create(
        first_name: "shane",
        last_name: "chang",
        email: "schang_codingdojo_com"
      )

      expect(user).to be_invalid
    end
  end



end
