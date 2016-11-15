require('pry-byebug')
require_relative('models/space_cowboy')

SpaceCowboy.delete_all

cowboy1 = SpaceCowboy.new({"name" => "Woody", "species" => "toy", "bounty_value" => 20, "danger_level" => "low", "last_known_location" => "toy store", "homeworld" => "Earth", "favourite_weapon" => ".40 calibre", "cashed_in" => false, "collected_by" => nil})
cowboy2 = SpaceCowboy.new({"name" => "Buzz", "species" => "Space Ranger", "bounty_value" => 30, "danger_level" => "medium", "last_known_location" => "moms car", "homeworld" => "Star Command", "favourite_weapon" => "wrist laser", "cashed_in" => true, "collected_by" => "Woody"})
cowboy3 = SpaceCowboy.new({"name" => "Jesse", "species" => "cowgirl", "bounty_value" => 50, "danger_level" => "high", "last_known_location" => "pizza planet", "homeworld" => "Texas", "favourite_weapon" => "bullseye", "cashed_in" => false, "collected_by" => nil})

cowboy1.save
cowboy2.save
cowboy3.save
cowboy1.favourite_weapon = "Revolver"
cowboy1.update
cowboys = SpaceCowboy.all()
binding.pry
nil