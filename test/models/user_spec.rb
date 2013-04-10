# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  points     :float
#  password_digest :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  remember_token  :string(255)
#

require 'spec_helper'

describe User do
  before do
    @user = User.new(
      name: "Example",
      email: "foo@bar.com",
      password: "foobar",
      points: 500,
      password_confirmation: "foobar"
    );
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:points) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }

  it { should be_valid }

  context "with no name" do
    before { @user.name = "" }
    it { should_not be_valid }

    before { @user.name = " "}
    it { should_not be_valid }
  end

  context "with name too long" do
    before { @user.name = 't' * 500 }
    it { should_not be_valid }
  end

  context "with no email" do
    before { @user.name = "" }
    it { should_not be_valid }
  end

  context "with an invalid email" do
    it "should be invalid" do
      addresses = %w[user@gfoo,com user_at_foo.com no.trailing@tld.
                    foo@no_underscore.com no@tld+plus.com]
      addresses.each do | invalid_address |
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  context "with a valid email" do
    it "should be valid" do
      addresses = %w[user@domain.com user+filter@domain.com]

      addresses.each do | valid_address |
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end

end
