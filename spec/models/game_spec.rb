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

    before do
      @game = FactoryGirl.create( :game,
        score1: 10,
        score2: 4,
        weight: 10
      )
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

  context "saving" do
    let!(:game) { FactoryGirl.build(:game) }

    it "saves points correctly" do
      game.score1 = 10
      game.score2 = 8

      game.save!

      game.points.should eq(15.0)
    end

    it "triggers user points update" do
      game.score1 = 10
      game.score2 = 8

      game.user1.should_receive(:adjust_points).once
      game.user2.should_receive(:adjust_points).once

      game.save!
    end
  end

  describe "helper methods" do
    let(:game) { FactoryGirl.build :game }

    before(:each) do
      game.score1 = 10
      game.score2 = 8

      game.user1.points = 400
    end

    context "#score_diff" do
      it "= 2" do
        game.score_diff.should eq(2)
      end
    end

    context "#user_diff" do
      it "= -100 for user1" do
        game.user_diff(game.user1).should eq(-100)
      end

      it "= 100 for user2" do
        game.user_diff(game.user2).should eq(100)
      end
    end

    context "#points_for" do
      it "= 19.2 for user1" do
        game.calculate

        game.points_for(game.user1).should eq(19.2)
      end

      it "= -19.2 for user2" do
        game.calculate

        game.points_for(game.user2).should eq(-19.2)
      end
    end
  end

  describe "calculation parameters" do
    let(:game) { FactoryGirl.build :game }
    context "G:" do
      it "draw" do
        game.score1 = 10
        game.score2 = 10

        game.G.should eq(1)
      end

      it "+1 to player1" do
        game.score1 = 10
        game.score2 = 9

        game.G.should eq(1)
      end

      it "+1 to player2" do
        game.score1 = 9
        game.score2 = 10

        game.G.should eq(1)
      end

      it "+2" do
        game.score1 = 10
        game.score2 = 8

        game.G.should eq(1.5)
      end

    end

    context "W:" do
      it "player1 win" do
        game.score1 = 10
        game.score2 = 9

        game.W(game.user1).should eq(1)
      end

      it "player2 win" do
        game.score1 = 9
        game.score2 = 10

        game.W(game.user2).should eq(1)
      end

      it "player1 loss" do
        game.score1 = 9
        game.score2 = 10

        game.W(game.user1).should eq(0)
      end

      it "player2 loss" do
        game.score1 = 10
        game.score2 = 9

        game.W(game.user2).should eq(0)
      end

      it "draw" do
        game.score1 = 10
        game.score2 = 10

        game.W(game.user1).should eq(0.5)
      end
    end

    context "dr:" do
      it "player1 higher" do
        game.user1.points = 500
        game.user2.points = 300

        game.dr(game.user1).should eq(200)
      end

      it "player2 higher" do
        game.user1.points = 200
        game.user2.points = 500

        game.dr(game.user1).should eq(-300)
      end

      it "players level" do
        game.user1.points = 500
        game.user2.points = 500

        game.dr(game.user1).should eq(0)
      end
    end

    context "We:" do
      context "130 point gap" do
        before(:each) do
          game.user1.points = 630
          game.user2.points = 500
        end

        it "player1" do
          game.We(game.user1).should eq(0.679)
        end

        it "player2" do
          game.We(game.user2).should eq(0.321)
        end
      end

      context "20 point gap" do
        before(:each) do
          game.user1.points = 500
          game.user2.points = 480
        end

        it "player1" do
          game.We(game.user1).should eq(0.529)
        end

        it "player2" do
          game.We(game.user2).should eq(0.471)
        end
      end
    end
  end

  describe "points calculations" do
    let(:teamA) { FactoryGirl.create(:user, points: 630) }
    let(:teamB) { FactoryGirl.create(:user, points: 500) }
    let(:teamC) { FactoryGirl.create(:user, points: 480) }

    context "example set 1" do
      before do
        @game = Game.new \
          user1: teamA,
          user2: teamB,
          weight: 20
      end

      context "Team A 3 : Team B 1" do
        before do
          @game.score1 = 3
          @game.score2 = 1
        end

        it "We is worked out correctly" do
          @game.We(teamA).should eq(0.679)
          @game.We(teamB).should eq(0.321)
        end

        it "P is worked out correctly" do
          @game.P(teamA).should eq(9.63)
          @game.P(teamB).should eq(-9.63)
        end
      end

      context "Team A 1 : Team B 3" do
        before do
          @game.score1 = 1
          @game.score2 = 3
        end

        it "P is worked out correctly" do
          @game.P(teamA).should eq(-20.37)
          @game.P(teamB).should eq(20.37)
        end
      end

      context "Team A 2 : Team B 2" do
        before do
          @game.score1 = 2
          @game.score2 = 2
        end

        it "P is worked out correctly" do
          @game.P(teamA).should eq(-3.58)
          @game.P(teamB).should eq(3.58)
        end
      end
    end

    context "example set 2" do
      before do
        @game = Game.new \
          user1: teamB,
          user2: teamC,
          weight: 20
      end

      context "Team B 3 : Team C 1" do
        before do
          @game.score1 = 3
          @game.score2 = 1
        end

        it "We is worked out correctly" do
          @game.We(teamB).should eq(0.529)
          @game.We(teamC).should eq(0.471)
        end

        it "P is worked out correctly" do
          @game.P(teamB).should eq(14.13)
          @game.P(teamC).should eq(-14.13)
        end
      end

      context "Team B 1 : Team C 3" do
        before do
          @game.score1 = 1
          @game.score2 = 3
        end

        it "P is worked out correctly" do
          @game.P(teamB).should eq(-15.87)
          @game.P(teamC).should eq(15.87)
        end
      end

      context "Team B 2 : Team C 2" do
        before do
          @game.score1 = 2
          @game.score2 = 2
        end

        it "P is worked out correctly" do
          @game.P(teamB).should eq(-0.58)
          @game.P(teamC).should eq(0.58)
        end
      end

    end
  end
end
