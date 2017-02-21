require 'rails_helper'

RSpec.describe User, type: :model do

  context "Match passwords" do
    it "should be equal" do
      @user = User.new(first_name: "Wang", last_name: "Edward", password: "1234", password_confirmation: "1234")
      expect(@user[:password]).to eq(@user[:password_confirmation])
    end
    it "should not be valid if missing pwd or confirm of pwd" do
      @user = User.new(first_name: "Wang", last_name: "Edward", password: "1234")
      expect(@user).to_not be_valid
    end
  end

  context "email" do
    it "should be case insensitive" do
      @user1 = User.create(first_name: "Wang", last_name: "Edward", email: "test@test.test", password: "1234", password_confirmation: "1234")
      @user2 = User.create(first_name: "Wang", last_name: "Edward", email: "tEst@teSt.tesT", password: "1234", password_confirmation: "1234")
      expect(@user2).to_not be_valid
    end
  end

  context "name" do
    it "should not be valid when I miss the first or last name" do
      @user = User.create(first_name: "Wang", email: "test@test.test", password: "1234", password_confirmation: "1234")
      expect(@user).to_not be_valid
    end
    it "should not be valid when I miss the first or last name" do
      @user = User.create(last_name: "Edward", email: "test@test.test", password: "1234", password_confirmation: "1234")
      expect(@user).to_not be_valid
    end
  end

  context "Password minimum length" do
    it "should not be valid if pwd length is shorter than 4" do
    @user = User.create(first_name: "Wang", last_name: "Edward", email: "test@test.test", password: "123", password_confirmation: "123")
    expect(@user).to_not be_valid
    end
  end

  describe ".authenticate_with_credentials" do
    before :each do
      @user = User.create(first_name: "Wang", last_name: "Edward", email: "test@test.com", password: "12345", password_confirmation: "12345")
    end

    it "should login when email and password are correct" do
      user = User.authenticate_with_credentials("test@test.com", "12345")
      expect(user).to be_instance_of(User)
    end

    it "should not logged in when the input email does not match" do
      user = User.authenticate_with_credentials("test@test.test", "12345")
      expect(user).to be_nil
    end
    it "should not logged in when the input pwd don't match" do
      user = User.authenticate_with_credentials("test@test.com", "56789")
      expect(user).to be_nil
    end

    it "should log in even add whitespace in email field" do
      user = User.authenticate_with_credentials("   test@test.com   ", "12345")
      expect(user).to be_instance_of(User)
    end
    it "should log in even mix upper and lower case in email in email field" do
      @user = User.authenticate_with_credentials("test@TEST.com", "12345")
      expect(@user).to be_instance_of(User)
    end
  end

end
