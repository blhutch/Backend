require 'test_helper'

class GuessTest < ActiveSupport::TestCase

  test 'should not save guess without guess string' do
    guess = Guess.new
    assert_not guess.save
  end

  test 'should not save if guess string is longer than 10 characters' do
    guess = Guess.new
    guess.guess = 'this string is much longer than ten characters'
    assert_not guess.save
  end  

  test 'should save if guess string is less than or equal to 10 characters' do
    guess = Guess.new
    guess.guess = 'test'
    assert guess.save
  end  

end