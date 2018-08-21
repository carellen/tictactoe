require 'rails_helper'

RSpec.describe Game, type: :model do
  scenario "players can make moves" do
    @game = Game.new(nil)
    @game.make_move({"move" => "1", "player" => "x"})
    @game.make_move({"move" => "5", "player" => "o"})
    expect(@game.moves).to eq({"1"=>"x",
                               "2"=>nil,
                               "3"=>nil,
                               "4"=>nil,
                               "5"=>"o",
                               "6"=>nil,
                               "7"=>nil,
                               "8"=>nil,
                               "9"=>nil})
  end

  scenario "draw" do
    @game = Game.new({"1"=>"o",
                      "2"=>"o",
                      "3"=>"x",
                      "4"=>"x",
                      "5"=>"x",
                      "6"=>"o",
                      "7"=>"o",
                      "8"=>"x",
                      "9"=>nil})
    @game.make_move({"move" => "9", "player" => "x"})

    expect(@game.draw?).to eq(true)
  end

  scenario "player X wins" do
    @game = Game.new({"1"=>"o",
                      "2"=>"o",
                      "3"=>"x",
                      "4"=>"x",
                      "5"=>"x",
                      "6"=>"o",
                      "7"=>nil,
                      "8"=>"o",
                      "9"=>"x"})
    @game.make_move({"move" => "7", "player" => "x"})

    expect(@game.win?("x")).to eq(true)
  end
end
