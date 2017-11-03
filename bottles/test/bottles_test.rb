require_relative '../../test_helper'
require_relative '../lib/bottles'

class BottleVerseTest < Minitest::Test
  def test_the_first_verse
    expected = "99 bottles of beer on the wall, " +
      "99 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "98 bottles of beer on the wall.\n"
    assert_equal expected, BottleVerse.new(99).lyrics
  end

  def test_another_verse
    expected = "3 bottles of beer on the wall, " +
      "3 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "2 bottles of beer on the wall.\n"
    assert_equal expected, BottleVerse.new(3).lyrics
  end

  def test_verse_2
    expected = "2 bottles of beer on the wall, " +
      "2 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "1 bottle of beer on the wall.\n"
    assert_equal expected, BottleVerse.new(2).lyrics
  end

  def test_verse_1
    expected = "1 bottle of beer on the wall, " +
      "1 bottle of beer.\n" +
      "Take it down and pass it around, " +
      "no more bottles of beer on the wall.\n"
    assert_equal expected, BottleVerse.new(1).lyrics
  end

  def test_verse_0
    expected = "No more bottles of beer on the wall, " +
      "no more bottles of beer.\n" +
      "Go to the store and buy some more, " +
      "99 bottles of beer on the wall.\n"
    assert_equal expected, BottleVerse.new(0).lyrics
  end
end

class VerseDouble
  def self.lyrics(number)
    new(number).lyrics
  end

  attr_reader :number
  def initialize(number)
    @number = number
  end

  def lyrics
    "This is verse #{number}.\n"
  end
end

class DescendingVerseSongTest < Minitest::Test
  def test_a_verse
    expected = "This is verse 98.\n"
    assert_equal expected, DescendingVerseSong.new(verse_template: VerseDouble).verse(98)
  end

  def test_a_couple_verses
    expected =
      "This is verse 99.\n" +
      "\n" +
      "This is verse 98.\n"
    assert_equal expected, DescendingVerseSong.new(verse_template: VerseDouble).verses(99, 98)
  end

  def test_the_whole_song
    expected =
      "This is verse 5.\n" +
      "\n" +
      "This is verse 4.\n" +
      "\n" +
      "This is verse 3.\n" +
      "\n" +
    "This is verse 2.\n"
    assert_equal expected, DescendingVerseSong.new(verse_template: VerseDouble, max: 5, min: 2).song
  end
end
