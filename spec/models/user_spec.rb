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
      password_confirmation: "foobar"
    );
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }

  it { should be_valid }
end
