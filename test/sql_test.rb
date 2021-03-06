require 'test_helper'

module Choker
  class SqlTest < Minitest::Test
    def test_correct_string_to_column_names
      assert_equal [:a, :b, :c], Choker::Sql.column_names('"a","b","c"')
    end

    def test_special_characters_removed_from_column_names
      assert_equal [:abc], Choker::Sql.column_names('abc;!?=\\')
    end

    def test_leading_white_spaces_removed_from_column_names
      assert_equal [:abc], Choker::Sql.column_names('     abc')
    end

    def test_underlines_not_removed_from_column_names
      assert_equal [:abc_def], Choker::Sql.column_names('abc_def')
    end
  end
end
