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

describe "Game" do
  context "validation" do
    let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }

    before do

      @game = Game.new(
        user1: user1,
        user2: user2,
        score1: 10,
        score2: 4,
        weight: 10
      );
    end

    subject { @game }

    it { should respond_to(:user1) }
    it { should respond_to(:user2) }
    it { should respond_to(:score1) }
    it { should respond_to(:score2) }
    it { should respond_to(:points) }
    it { should respond_to(:weight) }

    context "with no user" do
      before { @game.user1_id = nil }
      it { should_not be_valid }
    end

    context "with a bad score" do
      before { @game.points = -4 }
      it { should_not be_valid }
    end
  end

  describe "calculation parameters" do
    let(:game) { FactoryGirl.build :game }
    context "G:" do
      it "draw" do
        game.score1 = 10
        game.score2 = 10

        game.G(game).should eq(1)
      end

      it "+1 to player1" do
        game.score1 = 10
        game.score2 = 9

        game.G(game).should eq(1)
      end

      it "+1 to player2" do
        game.score1 = 9
        game.score2 = 10

        game.G(game).should eq(1)
      end

      it "+2" do
        game.score1 = 10
        game.score2 = 8

        game.G(game).should eq(1.5)
      end

    end

    context "W:" do
      it "player1 win" do
        game.score1 = 10
        game.score2 = 9

        game.W(game, game.user1).should eq(1)
      end

      it "player2 win" do
        game.score1 = 9
        game.score2 = 10

        game.W(game, game.user2).should eq(1)
      end

      it "player1 loss" do
        game.score1 = 9
        game.score2 = 10

        game.W(game, game.user1).should eq(0)
      end

      it "player2 loss" do
        game.score1 = 10
        game.score2 = 9

        game.W(game, game.user2).should eq(0)
      end

      it "draw" do
        game.score1 = 10
        game.score2 = 10

        game.W(game, game.user1).should eq(0.5)
      end
    end

    context "dr:" do
      it "player1 higher" do
        game.user1.points = 500
        game.user2.points = 300

        game.dr(game, game.user1).should eq(200)
      end

      it "player2 higher" do
        game.user1.points = 200
        game.user2.points = 500

        game.dr(game, game.user1).should eq(-300)
      end

      it "players level" do
        game.user1.points = 500
        game.user2.points = 500

        game.dr(game, game.user1).should eq(0)
      end
    end

    context "We:" do
      context "130 point gap" do
        before(:each) do
          game.user1.points = 630
          game.user2.points = 500
        end

        it "player1" do
          game.We(game, game.user1).should eq(0.679)
        end

        it "player2" do
          game.We(game, game.user2).should eq(0.321)
        end
      end

      context "20 point gap" do
        before(:each) do
          game.user1.points = 500
          game.user2.points = 480
        end

        it "player1" do
          game.We(game, game.user1).should eq(0.529)
        end

        it "player2" do
          game.We(game, game.user2).should eq(0.471)
        end
      end
    end
  end

  describe "points calculations" do
    context "example set 1" do

    end

    context "example set 2" do

    end
  end
end
