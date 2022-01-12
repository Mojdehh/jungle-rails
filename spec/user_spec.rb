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

  end

end