
# Write a test for the `word_count`. Make sure to utilize the setup and teardown methods for any file related operations.
require 'minitest/autorun'
require_relative 'text_class'


class TextTest < Minitest::Test
  def setup
    @file = File.open('./sample_text.txt', 'r')
  end

  def test_word_count
    text = Text.new(@file.read)
    assert_equal(72, text.word_count)
  end
  
  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"  # helps verify that we closed our file after every test.
  end
end