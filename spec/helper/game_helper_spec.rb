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

    context "dr:" do

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