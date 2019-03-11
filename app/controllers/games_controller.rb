require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    # display new random grid and form
    # The form will be submitted (with POST) to the score action.
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def score
    @word = params[:word]

    # if word.include?(@letters)
    #   if english_word?
    #     @score = "Well done"
    #   else
    #     @score = "not an english word"
    #   end
    # else
    #   "not in the grid"
    # end
  end

  def english_word?(word)
    response = open(`https://wagon-dictionary.herokuapp.com/autocomplete/#{word}`)
    json = JSON.parse(response.read)
    json['found']
  end
end
