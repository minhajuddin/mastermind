require File.join(File.dirname(__FILE__), '/../spec_helper')

module Mastermind
  describe Game do
    context "starting up" do
      before(:each) do
        @messenger = mock("messenger").as_null_object
        @game = Mastermind::Game.new(@messenger)
      end

      it "should send a welcome message" do
        @messenger.should_receive(:puts).with("Welcome to Mastermind!")
        @game.start(%w[r y g c])
      end

      it "should prompt for the first guess" do
        @messenger.should_receive(:puts).with("Enter guess:")
        @game.start(%w[r y g c])
      end
    end

    context "marking a guess" do

      context "with all 4 colors correct in the correct places" do
        it "should mark guesses with bbbb" do
          messenger = mock("messenger").as_null_object
          game = Mastermind::Game.new(messenger)
          game.start(%w[r g y c])
          messenger.should_receive(:puts).with("bbbb")
          game.guess(%w[r g y c])
        end
      end

      context "with all 4 colors correct and 2 in correct places" do
        it "should mark guesses with bbww" do
          messenger = mock("messenger").as_null_object
          game = Mastermind::Game.new(messenger)
          game.start(%w[r g y c])
          messenger.should_receive(:puts).with("bbww")
          game.guess(%w[r g c y])
        end
      end

      context "with all 4 colors correct and 1 in correct place" do
        it "should mark guesses with bwww" do
          messenger = mock("messenger").as_null_object
          game = Mastermind::Game.new(messenger)
          game.start(%w[r g y c])
          messenger.should_receive(:puts).with("bwww")
          game.guess(%w[g c y r])
        end
      end

    end
  end
end
