require 'spec_helper'
require 'rails_helper'

describe User do
  before { @user = User.new(name: "admin", email: "admin@example.com")}

  describe 'Associations' do
    it { should have_many(:short_urls) }
  end

  describe 'Validates presence' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email)}
  end

  describe 'Validates uniqueness' do
    it "email has already been taken" do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

end
