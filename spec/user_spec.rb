require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    user = User.new(
        name: "Mojdeh",
        email: "mojdeh@email.com",
        password: "test",
        password_confirmation: "test"
      )

    it "should create a valid user" do
      expect(user).to be_valid
    end


    it "should have a name to be valid user" do
      user.name = nil
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include "Name can't be blank"
    end


    it "should have an email to be valid user" do
      user.email = nil
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include "Email can't be blank"
    end


    it "should have a password with a min length of 3 to be valid user" do
      user.password = "te"
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include "Password is too short (minimum is 3 characters)"
    end


    it "should have a password and password confirmation" do
      user.password_confirmation= nil
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include "Password is too short (minimum is 3 characters)"
    end
    

  end

end