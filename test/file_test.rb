require 'test_helper'

module Choker
  class FileTest < Minitest::Test
    INVALID_PATH = ''.freeze
    ARTISTS_PATH = 'test/files/artists.csv'.freeze
    NOT_SUPPORTED_PATH = 'test/files/not_supported.xlsx'.freeze
    NO_HEADER_PATH = 'test/files/no_header.csv'.freeze

    def test_wrong_filepath
      exception = assert_raises(RuntimeError) { Choker::File.new(INVALID_PATH) }
      assert_equal "File '#{INVALID_PATH}' does not exist", exception.message
    end

    def test_not_supported_filepath
      exception = assert_raises(RuntimeError) { Choker::File.new(NOT_SUPPORTED_PATH) }
      assert_equal "File '#{NOT_SUPPORTED_PATH}' is not supported", exception.message
    end

    def test_supported_filepath
      assert artists_file
    end

    def test_number_of_lines_in_file
      assert_equal 10, artists_file.line_count
    end

    def test_header_row_option_default
      assert_equal '"artist_name","main_genre"', artists_file.header_row
    end

    def test_header_row_option_false
      file = Choker::File.new(NO_HEADER_PATH, header_row: false)
      assert_equal nil, file.header_row
    end

    private

    def artists_file
      Choker::File.new(ARTISTS_PATH)
    end
  end
end
