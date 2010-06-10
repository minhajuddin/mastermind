module Mastermind
  class Game
    def initialize(messenger)
      @messenger = messenger
    end

    def start(code)
      @messenger.puts "Welcome to Mastermind!"
      @messenger.puts "Enter guess:"
    end

    def guess(guess)
      
    end
  end
end
