require 'test_helper'

module Choker
  class SqlTest < Minitest::Test

    def test_sql_cleaner
      assert_equal 'SELECT * FROM chicago', Choker::Sql.sql('SELECT * FROM ?', 'chicago')
      assert_equal 'SELECT street FROM dublin', Choker::Sql.sql('SELECT ? FROM ?', 'street', 'dublin')
      assert_equal 'CREATE TABLE edinburgh ( castle VARCHAR NULL )', Choker::Sql.sql('CREATE TABLE ? ( ? VARCHAR NULL )', 'edinburgh', 'castle')
    end

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

    def test_tablenameize
      assert_equal 'table_name_csv', Choker::Sql.tablenameize('table_name.csv; --')
    end
  end
end
