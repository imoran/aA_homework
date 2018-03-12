require 'rails_helper'

describe User do
  subject(:user) do
    FactoryBot.build(:user,
      email: "isis@isis.com",
      password: "password")
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it "creates a password digest" do
    expect(user.password_digest).to_not be_nil
  end

  it "creates a session token before initialization" do
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe "#reset_session_token!" do
    it "resets session token" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_session_token)
    end
  end

  describe "#is_password?" do
    it "verifies a password is correct" do
      expect(user.is_password?("password")).to be true
    end

    it "verifies a password is not correct" do
      expect(user.is_password?("not_password")).to be false
    end
  end

  describe ".find_by_credentials" do
    before { user.save! }

    it "returns user given good credentials" do
      expect(User.find_by_credentials("isis@isis.com", "password")).to eq(user)
    end

    it "returns nil given bad credentials" do
      expect(User.find_by_credentials("not_isis@isis.com", "not_password")).to eq(nil)
    end
  end
end
