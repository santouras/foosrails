# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  user1_id   :integer
#  user2_id   :integer
#  score1     :integer
#  score2     :integer
#  points     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Game do
  let(:user1) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user) }

  before do

    @game = Game.new(
      user1_id: user1.id,
      user2_id: user2.id,
      score1: 10,
      score2: 4
    );
  end

  subject { @game }

  it { should respond_to(:user1_id) }
  it { should respond_to(:user2_id) }
  it { should respond_to(:score1) }
  it { should respond_to(:score2) }
  it { should respond_to(:points) }

  describe "with no user" do
    before { @game.user1_id = nil }
    it { should_not be_valid }
  end

  describe "with a bad score" do
    before { @game.points = -4 }
    it { should_not be_valid }
  end
end
