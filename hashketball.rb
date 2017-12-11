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
        },
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

# if we had players in an array instead of hash
# def find_player(player_name)
#   players = game_hash[:home][:players] + game_hash[:away][:players]
#   players.find { |player| player[:player_name] == player_name }
# end

def num_points_scored(name)
  game_hash.each do |location, info|
    return info[:players][name][:points] if info[:players].has_key?(name)
  end
end

#puts num_points_scored("Ben Gordon")

def shoe_size(name)
  game_hash.each do |location, info|
    if info[:players].has_key?(name)
      return info[:players][name][:shoe]
    end
  end
end

#puts shoe_size("Ben Gordon")

def team_colors(team_name)
  game_hash.map do |location, info|
    if info[:team_name] == team_name
      return info[:colors]
    end
  end
end

#puts team_colors("Brooklyn Nets")

def team_names
  game_hash.map do |location, info|
    info[:team_name]
  end
end

#puts team_names

def player_numbers(team_name)
  nums = []
  game_hash.map do |location, info|
    if info[:team_name] == team_name
      info[:players].each do |name, stats|
        nums.push(stats[:number])
      end
    end
  end
  nums
end

#puts player_numbers("Brooklyn Nets")

def player_stats(name)
  game_hash.each do |location, info|
    if info[:players].has_key?(name)
      return info[:players][name]
    end
  end
end

#puts player_stats("Ben Gordon")

def big_shoe_rebounds
  big_shoe = 0
  rebounds = 0
  game_hash.each do |location, info|
    info[:players].each do |name, stats|
      if big_shoe < stats[:shoe]
        big_shoe = stats[:shoe]
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end

#puts big_shoe_rebounds

def most_points_scored
  most_points_scored = 0
  player_name = nil
  game_hash.each do |location, info|
    info[:players].each do |name, stats|
      if stats[:points] > most_points_scored
        most_points_scored = stats[:points]
        player_name = name
      end
    end
  end
  player_name
end

#puts most_points_scored

def winning_team
  home_team = 0
  away_team = 0
  game_hash.each do |location, info|
    if location == :home
      info[:players].each do |name, stats|
        home_team += stats[:points]
      end
    if location == :away
      info[:players].each do |name, stats|
        away_team += stats[:points]
      end
    end
  end
  if home_team > away_team
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

puts winning_team
