require 'test_helper'

module Choker
  class Sql::DropTest < Minitest::Test
    def test_drop_table_sql
      assert_equal 'DROP TABLE  amsterdam', Choker::Sql::Drop.drop_table_sql('amsterdam')
    end

    def test_drop_table_if_exists_sql
      assert_equal 'DROP TABLE IF EXISTS berlin', Choker::Sql::Drop.drop_table_if_exists_sql('berlin')
    end
  end
end
