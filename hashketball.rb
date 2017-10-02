# Write your code here!
require "pry"

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(players_name) #returns the number of points scored for that player
  points = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.class == String
        data = data.split
      end
      data.each do |name, stats|
        if name == players_name
          points << game_hash[location][attribute][name][:points]
        end
      end
    end
  end
  points[0]
end

def shoe_size(players_name) #returns the shoe size for that player
  shoe_size = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.class == String
        data = data.split
      end
      data.each do |name, stats|
        if name == players_name
          shoe_size << game_hash[location][attribute][name][:shoe]
        end
      end
    end
  end
  shoe_size[0]
end

def team_colors(team_name) #returns an array of that teams colors
  team_colors = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
        team_colors << game_hash[location][:colors]
      end
    end
  end
  team_colors.flatten
end

def team_names #return an array of the team names
  t_names = []
  game_hash.each do |location, team_data|
    t_names << game_hash[location][:team_name]
    # team_data.each do |attribute, data|
    #   team_names << hash[location][:team_name]
    # end
  end
  t_names
end

def player_numbers(team) #returns an array of the jersey number's for that team
  jersey_numbers = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team
        game_hash[location][:players].each do |key, value|
          jersey_numbers << value[:number]
        end
      end
    end
  end
  jersey_numbers
end


def player_stats(player_name) #returns a hash of that player's stats
  player_stats = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.class == String
        data = data.split
      end
      data.each do |name, stats|
        if name == player_name
          player_stats = game_hash[location][attribute][name]
        end
      end
    end
  end
  player_stats
end

def big_shoe_rebounds #return the number of rebounds for with the player that has the largest shoe size
shoe_size = 0
rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute, data|
      if shoe_size < data[:shoe]
        shoe_size = data[:shoe]
        rebounds = data[:rebounds]
      end
    end
  end
  rebounds
end
