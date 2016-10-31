require 'test_helper'

class Choker::Sql::SelectTest < Minitest::Test
  def test_select_count
    assert_equal 'SELECT count(*) FROM table_name', Choker::Sql::Select.select_count_sql('table_name')
  end
end
