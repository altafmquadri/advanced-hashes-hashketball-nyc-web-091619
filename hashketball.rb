require 'pry'

def game_hash
  game_hash = {
    home: 
    {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" =>
          {
            number: "0",
            shoe: "16",
            points: "22",
            rebounds: "12",
            assists: "12",
            steals: "3",
            blocks: "1",
            slam_dunks: "1"
          },
        
        "Reggie Evans"=>
          {
            number: "30",
            shoe: "14",
            points: "12",
            rebounds: "12",
            assists: "12",
            steals: "12",
            blocks: "12",
            slam_dunks: "7"
          },
          
          "Brook Lopez"=>
          {
            number: "11",
            shoe: "17",
            points: "17",
            rebounds: "19",
            assists: "10",
            steals: "3",
            blocks: "1",
            slam_dunks: "15"
          },
          
          "Mason Plumlee"=>
          {
            number: "1",
            shoe: "19",
            points: "26",
            rebounds: "11",
            assists: "6",
            steals: "3",
            blocks: "8",
            slam_dunks: "5"
          },
          
          "Jason Terry"=>
          {
            number: "31",
            shoe: "15",
            points: "19",
            rebounds: "2",
            assists: "2",
            steals: "4",
            blocks: "11",
            slam_dunks: "1"
          }
      }
    },
    away: 
    {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien"=>
          {
            number: "4",
            shoe: "18",
            points: "10",
            rebounds: "1",
            assists: "1",
            steals: "2",
            blocks: "7",
            slam_dunks: "2"
          },
          
          "Bismack Biyombo"=>
          {
            number: "0",
            shoe: "16",
            points: "12",
            rebounds: "4",
            assists: "7",
            steals: "22",
            blocks: "15",
            slam_dunks: "10"
          },
          
          "DeSagna Diop"=>
          {
            number: "2",
            shoe: "14",
            points: "24",
            rebounds: "12",
            assists: "12",
            steals: "4",
            blocks: "5",
            slam_dunks: "5"
          },
          
          "Ben Gordon"=>
          {
            number: "8",
            shoe: "15",
            points: "33",
            rebounds: "3",
            assists: "2",
            steals: "1",
            blocks: "1",
            slam_dunks: "0"
          },
          
          "Kemba Walker"=>
          {
            number: "33",
            shoe: "15",
            points: "6",
            rebounds: "12",
            assists: "12",
            steals: "7",
            blocks: "5",
            slam_dunks: "12"
          }
      }
    }
  }
  game_hash
end


def num_points_scored(player_name)
  points = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      player[0] == player_name ? (points = player[1][:points]) : false
      #binding.pry
    end
  end
  points.to_i
end

def shoe_size(player_name)
  shoes = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      player[0] == player_name ? (shoes = player[1][:shoe]) : false
    end
  end
  shoes.to_i
end

def team_colors(team_name)
  colors = []
  game_hash.each do |location, team_data|
    team_data[:team_name] == team_name ? team_data[:colors].each {|color| colors.push(color)} : false
  end
  colors
end

def team_names
  teams = []
  game_hash.each do |location, team_data|
    teams.push(team_data[:team_name])
    #binding.pry  
  end
  teams
end

def player_numbers(team_name)
  jerseys = []
  game_hash.each do |location, team_data|
    team_data[:team_name] == team_name ? team_data[:players].each { |player, stats| jerseys.push((stats[:number]).to_i)} : false
      #binding.pry
  end
  jerseys
end

def player_stats(player_name)
  stats = {}
  game_hash.each do |location, team_data|
    team_data[:players][player_name] ? stats = team_data[:players][player_name] : false
    stats.each {|key, value| value.class == String ? stats[key] = value.to_i : false}
  end
  stats
end

def big_shoe_rebounds
  max = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      stats.each do |key, value|
        stats[:shoe].to_i > max ? (max = stats[:shoe].to_i; rebounds = stats[:rebounds].to_i) : false
          #binding.pry
      end
    end
  end
  rebounds
end

def most_points_scored
  max_points = 0
  player_most_points = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      stats.each do |key, value|
        stats[:points].to_i > max_points ? (max_points = stats[:points].to_i; player_most_points = player) : false
        #binding.pry
      end
    end
  end
  player_most_points
end


def winning_team
  home_team = 0
  away_team = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      location == :home ? home_team += stats[:points].to_i : away_team += stats[:points].to_i
    end
  end
  home_team > away_team ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end












def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      binding.pry
 
      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end