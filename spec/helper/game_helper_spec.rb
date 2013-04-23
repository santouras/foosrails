require "spec_helper"

describe "GameHelper" do

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

        game.dr.should eq(200)
      end

      it "player2 higher" do
        game.user1.points = 200
        game.user2.points = 500

        game.dr.should eq(300)
      end

      it "players level" do
        game.user1.points = 500
        game.user2.points = 500

        game.dr.should eq(0)
      end
    end

    context "We:" do

    end
  end

  describe "points calculations" do
    context "example set 1" do

    end

    context "example set 2" do

    end
  end
end