require 'bundler/setup'
Bundler.require

require "pry"
require 'random-word'
require 'highline/import'
require 'pstore'
require 'colorize'

require_relative '../app/hangman.rb'
require_relative '../app/graphic.rb'
require_relative '../app/users.rb'
require_relative '../app/game.rb'
