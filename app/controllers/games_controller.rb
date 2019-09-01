require 'json'
require 'open-uri'
class GamesController < ApplicationController
  def new
    @range = (0...10).map { (65 + rand(26)).chr }
  end

  def score
    @array_letters = params[:range].split
    @word = params[:word].upcase
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    word_page = open(url).read
    hash = JSON.parse(word_page)
    @found = hash['found']
  end
end
