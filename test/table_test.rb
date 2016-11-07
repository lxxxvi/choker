require 'test_helper'

module Choker
  class TableTest < Minitest::Test
    def test_dummy_column_names_generator
      assert_equal [:column_1, :column_2, :column_3], Choker::Table.dummy_column_names(3)
    end

    def test_column_name_precedence_custom_columns
      assert_equal [:d, :e], Choker::Table.new(artists_file, column_names: [:d, :e]).column_names
    end

    def test_column_name_precedence_columns_from_file
      assert_equal [:artist_name, :main_genre], Choker::Table.new(artists_file).column_names
    end

    def test_column_name_precedence_dummy_columns
      file = Choker::File.new(Choker::FileTest::ARTISTS_PATH, first_row_is_header: false)
      assert_equal [:column_1, :column_2], Choker::Table.new(file).column_names
    end

    def test_column_count_mismatch
      exception = assert_raises(RuntimeError) { Choker::Table.new(artists_file, column_names: [:f, :g, :h]) }
      assert_equal 'Column count mismatch (file: 2, given columns: 3)', exception.message
    end

    def test_duplicate_column_names
      exception = assert_raises(RuntimeError) { Choker::Table.new(artists_file, column_names: [:i, :i]) }
      assert_equal 'Duplicate column names ([{:column_name=>:i, :count=>2}])', exception.message
    end

    def test_table_name
      assert_equal 'choker_artists_csv', Choker::Table.new(artists_file).table_name
    end

    private

    def artists_file
      Choker::File.new(Choker::FileTest::ARTISTS_PATH)
    end
  end
end
